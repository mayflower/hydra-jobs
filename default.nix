/* A small release file, with few packages to be built.  The aim is to reduce
   the load on Hydra when testing the `stdenv-updates' branch. */

{ nixpkgs
, supportedSystems ? [ "x86_64-linux" ]
}:

with import <nixpkgs/pkgs/top-level/release-lib.nix> { inherit supportedSystems; };
(mapTestOn (rec {

  aspell = all;
  at = linux;
  aterm25 = all;
  autoconf = all;
  automake = all;
  avahi = allBut cygwin;  # Cygwin builds fail
  bash = all;
  bashInteractive = all;
  bc = all;
  binutils = linux;
  bind = linux;
  bsdiff = all;
  bzip2 = all;
  chrony = all;
  cmake = all;
  coreutils = all;
  cpio = all;
  cron = linux;
  cups = linux;
  dhcp = linux;
  diffutils = all;
  dnsmasq = all;
  e2fsprogs = linux;
  emacs24 = gtkSupported;
  enscript = all;
  file = all;
  findutils = all;
  flex = all;
  gcc = all;
  gcj = linux;
  glibc = linux;
  glibcLocales = linux;
  gnat = linux;
  gnugrep = all;
  gnum4 = all;
  gnumake = all;
  gnupatch = all;
  gnupg = linux;
  gnuplot = allBut cygwin;
  gnused = all;
  gnutar = all;
  gnutls = linux;
  gogoclient = linux;
  grub = linux;
  grub2 = linux;
  gsl = linux;
  guile = linux;  # tests fail on Cygwin
  gzip = all;
  hddtemp = linux;
  hdparm = linux;
  hello = all;
  host = linux;
  i3 = all;
  i3lock = all;
  i3status = all;
  iana_etc = linux;
  icewm = linux;
  idutils = all;
  ifplugd = linux;
  inetutils = linux;
  iputils = linux;
  irssi = all;
  jnettop = linux;
  jwhois = linux;
  kbd = linux;
  keen4 = ["i686-linux"];
  kvm = linux;
  libvirt = all;
  qemu = linux;
  qemu_kvm = linux;
  less = all;
  lftp = all;
  liblapack = linux;
  libtool = all;
  libtool_2 = all;
  libxml2 = all;
  libxslt = all;
  lout = linux;
  lsh = linux;
  lsof = linux;
  ltrace = linux;
  lvm2 = linux;
  lxc = linux;
  lxd = linux;
  lynx = linux;
  lzma = linux;
  man = linux;
  manpages = linux;
  mc = all;
  mcron = linux;
  mdadm = linux;
  mesa = mesaPlatforms;
  mingetty = linux;
  mk = linux;
  mktemp = all;
  module_init_tools = linux;
  monotone = linux;
  mpg321 = linux;
  mplayer = all;
  mutt = linux;
  mysql = linux;
  ncat = linux;
  netcat = all;
  nfs-utils = linux;
  nix = all;
  nixUnstable = all;
  nss_ldap = linux;
  nssmdns = linux;
  ntfs3g = linux;
  ntp = linux;
  openssh = linux;
  openssl = all;
  packer = all;
  pan = gtkSupported;
  par2cmdline = all;
  pciutils = linux;
  pdf2xml = all;
  perl = all;
  pkgconfig = all;
  pmccabe = linux;
  policykit = linux;
  portmap = linux;
  procps = linux;
  profanity = all;
  pulseaudioLight = all;
  python = allBut cygwin;
  pythonFull = linux;
  readline = all;
  redshift = all;
  rlwrap = all;
  rpm = linux;
  rsync = linux;
  screen = linux ++ darwin;
  scrot = linux;
  sdparm = linux;
  sharutils = all;
  sloccount = allBut cygwin;
  smartmontools = all;
  sqlite = allBut cygwin;
  squid = linux;
  ssmtp = linux;
  stdenv = all;
  strace = linux;
  su = linux;
  sudo = linux;
  sysklogd = linux;
  syslinux = ["i686-linux"];
  sysvinit = linux;
  sysvtools = linux;
  tcl = linux;
  tcpdump = linux;
  terminator = all;
  time = linux;
  tinycc = linux;
  udev = linux;
  unrar = linux;
  unzip = all;
  upstart = linux;
  usbutils = linux;
  utillinux = linux;
  utillinuxCurses = linux;
  w3m = all;
  webkit = linux;
  wget = all;
  which = all;
  wireshark = linux;
  wirelesstools = linux;
  wpa_supplicant = linux;
  xfsprogs = linux;
  xkeyboard_config = linux;
  xkill = all;
  zathura = all;
  zile = linux;
  zip = all;

  dbus = {
    libs = linux;
    daemon = linux;
    tools = linux;
  };

} ))
