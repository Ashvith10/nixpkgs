{
  lib,
  stdenv,
  fetchFromGitHub,
  desktop-file-utils,
  gobject-introspection,
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
  libhelium,
  webkitgtk_6_0,
  tau-helium-gtk-theme,
  tau-hydrogen-icon-theme,
  wrapGAppsHook4
}:

stdenv.mkDerivation rec {
  pname = "skiff-desktop";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "FyraLabs";
    repo = "skiff-desktop";
    rev = "${version}";
    hash = "sha256-hJh9Ll1MLkylTQRJlIXCkAR5BlW5asvbllSUYS3MJ/g=";
  };

  nativeBuildInputs = [
    desktop-file-utils
    gobject-introspection
    meson
    ninja
    pkg-config
    vala
    cmake
    appstream
    libgee
    blueprint-compiler
    libhelium
    webkitgtk_6_0
    wrapGAppsHook4
  ];

  buildInputs = [
    gtk4
    libadwaita
    tau-helium-gtk-theme
    tau-hydrogen-icon-theme
   ];

  preFixup = ''
    gappsWrapperArgs+=(
      --prefix XDG_DATA_DIRS : "${tau-helium-gtk-theme}/share"
      --prefix XDG_DATA_DIRS : "${tau-hydrogen-icon-theme}/share"
    )
  '';

  meta = with lib; {
    description = "Skiff, now on a Linux Desktop near you!";
    homepage = "https://github.com/FyraLabs/skiff-desktop/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ashvith-shetty ];
    platforms = platforms.unix;
    mainProgram = "com.fyralabs.SkiffDesktop";
  };
}