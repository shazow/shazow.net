{
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        sharedBuildInputs = with pkgs; [
          hugo
          sassc
          gnumake
        ];
      in
      {
        apps.default = {
          type = "app";
          program = "${pkgs.hugo}/bin/hugo server";
        };

        packages.default = pkgs.stdenv.mkDerivation {
          name = "shazow.net";
          src = self;
          nativeBuildInputs = sharedBuildInputs;
          buildPhase = ''
            make -C scss
            hugo
          '';
          installPhase = ''
            cp -r build $out
          '';
        };

        devShells.default = pkgs.mkShell {
          buildInputs = sharedBuildInputs ++ [ pkgs.pup ];
          shellHook = ''
            export PS1="[dev] $PS1"
            export PATH=$PWD/node_modules/.bin:$PATH
            [[ -f .env ]] && source .env
          '';
        };
      });
}
