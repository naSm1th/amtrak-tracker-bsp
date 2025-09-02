{
  description = "Example flake environment for build buildroot projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.05";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ];
      systems = [ "x86_64-linux" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        devShells.default = (pkgs.buildFHSUserEnv {
          name = "buildroot";
          targetPkgs = pkgs: (with pkgs;
            [
              (lib.hiPrio gcc)
              file
              gnumake
              ncurses.dev
              pkg-config
              unzip
              wget
              libxcrypt
            ] ++ pkgs.linux.nativeBuildInputs);
        }).env;
      };
      flake = {
      };
    };
}
