{
  stdenv,
  lib,
  fetchFromGitHub,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "rebol3";
  version = "3.15.0-bootstrap";

  src = fetchFromGitHub {
    owner = "Siskin-framework";
    repo = "Rebol";
    rev = finalAttrs.version;
    hash = "sha256-KlnTOnE+xzO2LQeidZ0PPepzyeluFimOAldHCnUOrow=";
  };

  buildPhase = ''
    cd make && make -f rebol-linux-bootstrap-64bit.mk
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv rebol-linux-bootstrap-64bit $out/bin
  '';

  meta = with lib; {
    description = "Source code for the Rebol [R3] interpreter";
    homepage = "https://github.com/Oldes/Rebol3";
    license = licenses.asl20;
    platforms = platforms.linux;
    maintainers = with maintainers; [ ashvith-shetty ];
  };
})
