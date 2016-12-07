{ nixpkgs
, supportedSystems ? [ "armv7l-linux" ]
}:

with import <nixpkgs/pkgs/top-level/release-lib.nix> { inherit supportedSystems; };

(mapTestOn {
  bash = all;
  binutils = all;
  bc = all;
  bzip2 = all;
  chrony = all;
  ntp = all;
  cmake = all;
  coreutils = all;
  cpio = all;
  ddrescue = all;
  dhcp = all;
  dhcpcd = all;
  dnsmasq = all;
  e2fsprogs = all;
  ed = all;
  ethtool = all;
  file = all;
  gcc = all;
  gettext = all;
  git = all;
  gitMinimal = all;
  glibcLocales = all;
  gnugrep = all;
  gnumake = all;
  gnupg = all;
  gnused = all;
  gnutar = all;
  gnutls = all;
  graphviz = all;
  haveged = all;
  hdparm = all;
  htop = all;
  idutils = all;
  iftop = all;
  inetutils = all;
  iotop = all;
  jq = all;
  less = all;
  lftp = all;
  libressl = all;
  lsof = all;
  lvm2 = all;
  lynx = all;
  lzma = all;
  man = all;
  mailutils = all;
  manpages = all;
  mdadm = all;
  mercurial = all;
  mpg123 = all;
  mtr = all;
  nano = all;
  ncdu = all;
  ncftp = all;
  netcat = all;
  nginx = all;
  nix = all;
  nix-repl = all;
  nixUnstable = all;
  nixops = all;
  nixopsUnstable = all;
  nmap = all;
  nodejs = all;
  ntfs3g = all;
  openal = all;
  openssh = all;
  pam = all;
  patch = all;
  patchelf = all;
  parallel = all;
  pkgconfig = all;
  postgresql = all;
  procps = all;
  pv = all;
  ruby = all;
  screen = all;
  sharutils = all;
  simp_le = all;
  smartmontools = all;
  socat = all;
  sshfsFuse = all;
  stdenv = all;
  strace = all;
  su = all;
  sudo = all;
  systemd = all;
  tcpdump = all;
  tinc_pre = all;
  tmux = all;
  tor = all;
  tzdata = all;
  unbound = all;
  units = all;
  unzip = all;
  usbutils = all;
  utillinux = all;
  vim = all;
  w3m = all;
  wget = all;
  which = all;
  whois = all;
  wirelesstools = all;
  wpa_supplicant = all;
  xfsprogs = all;
  xz = all;
  zlib = all;
  zsh = all;
})
