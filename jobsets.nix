{ nixpkgs ? <nixpkgs>, declInput ? {} }:

let
  pkgs = import nixpkgs {};
  defaultSettings = {
    enabled = true;
    hidden = false;
    description = "";
    input = "jobs";
    path = "default.nix";
    keep = 1;
    shares = 42;
    interval = 60;
    inputs = {
      jobs = {
        type = "git";
        value = "git://github.com/mayflower/hydra-jobs";
      };
      nixpkgs = {
        type = "git";
        value = "git://github.com/mayflower/nixpkgs";
      };
      supportedSystems = {
        type = "nix";
        value = ''[ \"x86_64-linux\" ]'';
      };
    };
    mail = true;
    mailOverride = "devnull+hydra@mayflower.de";
  };
  jobsetsAttrs = with pkgs.lib; mapAttrs (name: settings: recursiveUpdate defaultSettings settings) (rec {
    bootstrap-tools = {
      keep = 2;
      input = "nixpkgs";
      path = "pkgs/stdenv/linux/make-bootstrap-tools.nix";
    };
    hydra-jobs-master = {
      keep = 3;
      shares = 420;
    };
    hydra-jobs-production = recursiveUpdate hydra-jobs-master {
      inputs.nixpkgs.value = "${defaultSettings.inputs.nixpkgs.value} production";
    };
    hydra-jobs-darwin = {
      inputs.supportedSystems.value = ''[ \"x86_64-darwin\" ]'';
    };
    mayflower-master = {
      path = "dist.nix";
    };
    mayflower-production = {
      path = "dist.nix";
      inputs = hydra-jobs-production.inputs;
    };
    nixos-small-master = {
      input = "nixpkgs";
      path = "nixos/release-small.nix";
    };
    nixos-small-production = {
      input = "nixpkgs";
      path = "nixos/release-small.nix";
      inputs = hydra-jobs-production.inputs;
    };
    php = {
      path = "php.nix";
      inputs.supportedSystems.value = ''[ \"x86_64-linux\" \"x86_64-darwin\" ]'';
    };
    nixpkgs-manual = {
      input = "nixpkgs";
      path = "doc/default.nix";
    };
    hydra-jobs-openssl-1_1 = {
      inputs.nixpkgs.value = "${defaultSettings.inputs.nixpkgs.value} openssl-1.1";
    };
    "hydra-jobs-release-17.09"= {
      inputs.nixpkgs.value = "git://github.com/nixos/nixpkgs release-17.09";
      interval = 1800;
    };
    hydra-jobs-cross-rewrite = {
      inputs.nixpkgs.value = "git://github.com/obsidiansystems/nixpkgs deps-reorg";
    };
    #hydra-jobs-arm = {
    #  path = "arm.nix";
    #  inputs = {
    #    nixpkgs = {
    #      value = "${defaultSettings.inputs.nixpkgs.value} hydra-arm";
    #    };
    #    supportedSystems = {
    #      value = ''[ \"armv7l-linux\" ]'';
    #    };
    #  };
    #};
  });
  fileContents = with pkgs.lib; ''
    cat <<EOF
    ${builtins.toXML declInput}
    EOF
    cat > $out <<EOF
    {
      ${concatStringsSep "," (mapAttrsToList (name: settings: ''
        "${name}": {
            "enabled": ${if settings.enabled then "1" else "0"},
            "hidden": ${if settings.hidden then "true" else "false"},
            "description": "${settings.description}",
            "nixexprinput": "${settings.input}",
            "nixexprpath": "${settings.path}",
            "checkinterval": ${toString settings.interval},
            "schedulingshares": ${toString settings.shares},
            "enableemail": ${if settings.mail then "true" else "false"},
            "emailoverride": "${settings.mailOverride}",
            "keepnr": ${toString settings.keep},
            "inputs": {
              ${concatStringsSep "," (mapAttrsToList (inputName: inputSettings: ''
                "${inputName}": { "type": "${inputSettings.type}", "value": "${inputSettings.value}", "emailresponsible": false }
              '') settings.inputs)}
            }
        }
      '') jobsetsAttrs)}
    }
    EOF
  '';
in {
  jobsets = pkgs.runCommand "spec.json" {} fileContents;
}
