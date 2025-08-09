{
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        buildInputs = with pkgs; [
          hugo
          sassc
          gnumake
        ];

        hugo-server-wrapper = pkgs.writeShellScriptBin "hugo-server" ''
          #!/bin/sh
          exec ${pkgs.hugo}/bin/hugo server "$@"
        '';
      in
      {
        apps.default = {
          type = "app";
          program = "${hugo-server-wrapper}/bin/hugo-server";
        };

        packages.default = pkgs.stdenv.mkDerivation {
          name = "shazow.net";
          src = self;
          nativeBuildInputs = buildInputs;
          buildPhase = ''
            make -C scss
            hugo
          '';
          installPhase = ''
            cp -r build $out
          '';
        };

        devShells.default = pkgs.mkShell {
          buildInputs = buildInputs ++ [
            # I forget why I needed pup, probably when I was migrating from the old blog?
            pkgs.pup
          ];
          shellHook = ''
            export PS1="[dev] $PS1"
            export PATH=$PWD/node_modules/.bin:$PATH
            [[ -f .env ]] && source .env
          '';
        };
      });
}
