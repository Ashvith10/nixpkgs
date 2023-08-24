{
  stdenv,
  lib,
  fetchFromGitHub,
  meson,
  dart-sass,
  ninja,
}:

stdenv.mkDerivation rec {
  pname = "tau-helium-gtk-theme";
  version = "1.5.5";

  src = fetchFromGitHub {
    owner = "tau-OS";
    repo = "tau-helium";
    rev = "${version}";
    sha256 = "sha256-aeCcxg5CJ4gvRQoQm6gBgnSCyixNjCn9pirGJOOQCdI=";
  };

  nativeBuildInputs = [
    meson
    dart-sass
    ninja
  ];

  mesonFlags = [
    "-Dgtk4=true"
    "-Dshell=false"
  ];

  meta = with lib; {
    description = "The GTK/GNOME Shell theme for tauOS";
    homepage = "https://github.com/tau-OS/tau-helium";
    license = licenses.gpl3;
    platforms = platforms.unix;
    maintainers = with maintainers; [ ashvith-shetty ];
  };
}
