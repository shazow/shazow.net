with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "shazow.net";

  src = null;

  buildInputs = [
    hugo
    sassc
    pup
  ];
}
