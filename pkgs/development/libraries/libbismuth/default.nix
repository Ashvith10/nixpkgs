{
  lib,
  stdenv,
  fetchFromGitHub,
  gtk4,
  meson,
  ninja,
  cmake,
  pkg-config,
  vala,
  gobject-introspection,
  appstream,
  libgee,
  fribidi,
  python3
}:

stdenv.mkDerivation rec {
  pname = "bismuth";
  version = "1.0.5";

  src = fetchFromGitHub {
    owner = "tau-OS";
    repo = "libbismuth";
    rev = "${version}";
    hash = "sha256-sbKzLqhdzbQWlC3mn1DhRxFrTB9C5IV3NgHDux3F9TA=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    vala
    cmake
    appstream
    libgee
    gobject-introspection
    fribidi
    python3
  ];

  buildInputs = [
    gtk4
  ];

  postPatch = ''
    patchShebangs src/gen-public-types.py
  '';

  meta = with lib; {
    description = "Based on libadwaita responsive widgets, without all the baggage.";
    homepage = "https://github.com/tau-OS/libbismuth";
    license = licenses.lgpl21;
    maintainers = with maintainers; [ ashvith-shetty ];
    platforms = platforms.unix;
  };
}