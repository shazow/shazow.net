This project uses a nix flake.

If `nix` is not available, use `sudo apt-get install -y nix` to install and `echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf` to enable flakes.

`nix build` will produce a static build.

`nix develop` will enter the development environment with the required dependencies.

`nix run` will run the hugo development server on `localhost:1313`
