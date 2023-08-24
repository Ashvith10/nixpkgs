{
  stdenv,
  lib,
  fetchFromGitHub,
  meson,
  dart-sass,
  ninja,
  librsvg,
  xorg
}:

stdenv.mkDerivation rec {
  pname = "tau-hydrogen-icon-theme";
  version = "1.0.11";

  src = fetchFromGitHub {
    owner = "tau-OS";
    repo = "tau-hydrogen";
    rev = "${version}";
    sha256 = "sha256-ECrRWWS/Am0lfCIJw/BVZg53oLw79Im8d8KgAYxE+pw=";
  };

  nativeBuildInputs = [
    meson
    dart-sass
    ninja
    librsvg
    xorg.xcursorgen
  ];

  # mesonFlags = [
    # "-Dgtk4=true"
    # "-Dshell=false"
  # ];

  meta = with lib; {
    description = "The GTK icon theme for tauOS";
    homepage = "https://github.com/tau-OS/tau-hydrogen";
    license = licenses.gpl3;
    platforms = platforms.unix;
    maintainers = with maintainers; [ ashvith-shetty ];
  };
}