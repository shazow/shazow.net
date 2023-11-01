{
  outputs = {
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let pkgs = import nixpkgs { inherit system; };
    in {
      devShells.default = with pkgs; mkShell {
        buildInputs = [
          hugo
          sassc
          pup
        ];

        shellHook = ''
          export PS1="[dev] $PS1"
          export PATH=$PWD/node_modules/.bin:$PATH

          [[ -f .env ]] && source .env
        '';
      };
    });
}
