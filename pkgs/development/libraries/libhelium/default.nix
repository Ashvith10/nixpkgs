{
  lib,
  stdenv,
  fetchFromGitHub,
  blueprint-compiler,
  gtk4,
  libadwaita,
  meson,
  ninja,
  cmake,
  pkg-config,
  vala,
  appstream,
  libgee,
  libbismuth,
  tau-helium-gtk-theme,
  tau-hydrogen-icon-theme,
  wrapGAppsHook4
}:

stdenv.mkDerivation rec {
  pname = "helium";
  version = "1.7.1";

  src = fetchFromGitHub {
    owner = "tau-OS";
    repo = "libhelium";
    rev = "${version}";
    hash = "sha256-hkZXzoZswxzOdgyBJXAE7+7MrBRu2azNYlLz8UL+cVo=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    vala
    cmake
    appstream
    libgee
    blueprint-compiler
    libbismuth
    wrapGAppsHook4
  ];

  buildInputs = [
    gtk4
    libadwaita
    tau-helium-gtk-theme
    tau-hydrogen-icon-theme
  ];

  mesonFlags = [
    "-Dstylesheet=false"
    "-Ddemo=true"
  ];
  
  preFixup = ''
    gappsWrapperArgs+=(
      --prefix XDG_DATA_DIRS : "${tau-helium-gtk-theme}/share"
      --prefix XDG_DATA_DIRS : "${tau-hydrogen-icon-theme}/share"
    )
  '';

  meta = with lib; {
    description = "The Application Framework for tauOS apps.";
    homepage = "https://github.com/tau-OS/libhelium";
    license = licenses.lgpl3;
    maintainers = with maintainers; [ ashvith-shetty ];
    platforms = platforms.unix;
  };
}