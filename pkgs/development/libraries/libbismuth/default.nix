{
  lib,
  stdenv,
  fetchFromGitHub,
  gtk4,
  meson,
  ninja,
  pkg-config,
  vala,
  gobject-introspection,
  fribidi,
  python3
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libbismuth";
  version = "1.0.5";

  src = fetchFromGitHub {
    owner = "tau-OS";
    repo = finalAttrs.pname;
    rev = finalAttrs.version;
    hash = "sha256-sbKzLqhdzbQWlC3mn1DhRxFrTB9C5IV3NgHDux3F9TA=";
  };

  nativeBuildInputs = [
    gtk4
    meson
    ninja
    pkg-config
    vala
    gobject-introspection
    fribidi
    python3
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
})
