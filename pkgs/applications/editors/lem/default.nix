{
  pkgs,
  lib,
  stdenv,
  fetchFromGitHub
}:
stdenv.mkDerivation rec {
  pname = "lem";
  version = "2.1.0";

  meta = with lib; {
    description = "Common Lisp editor/IDE with high expansibility";
    longDescription = ''
    Lem is an editor/IDE well-tuned for Common Lisp development.
    It is designed to be lightweight and fast, while still providing a
    rich set of features for Common Lisp development. Lem supports other
    programming languages thanks to its built-in LSP client. You can
    choose between an Emacs and a Vim mode.
    
    Other Lem features include:
    - A project explorer tree view
    - Project-aware commands
    - Interactive `grep` and `git` interfaces
    - Multiple cursors
    - Tetris
    - and more...
    '';
    maintainers = with maintainers; [ ashvithshetty ];
    license = with licenses; [ mit ];
    platforms = platforms.unix;
  };

  src = fetchFromGitHub {
    owner = "lem-project";
    repo = pname;
    rev = "v${version}";
    sha256 = "1bjm6z33n1ksjvqs5v1g1mz4f8bsx1lka85sspmlnsbswwap58k0";
  };

  sbcl' = pkgs.sbcl.withPackages (ps: with ps; [
    quick-patch
    ncurses-clone-for-lem
  ]);
  
  nativeBuildInputs = [ sbcl' ];
  
  buildPhase = ''
    ${sbcl'}/bin/sbcl \
    --load scripts/patch-build-ncurses.lisp
  '';

  installPhase = ''
    echo "TODO: Install phase jobs..."
  '';
}