{
  description = "Example flake environment for build buildroot projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ];
      systems = [ "x86_64-linux" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        devShells.default = (pkgs.buildFHSEnv {
          name = "buildroot";
          targetPkgs = pkgs: (with pkgs;
            [
              (lib.hiPrio gcc12)
              (lib.hiPrio gcc12Stdenv)
              bashInteractive
              bc
              binutils
              bzip2
              ccache # optional, speeds up consecutive builds
              cmake
              cpio
              diffutils
              expat # not mentioned in buildroot deps; dep of host-libxml-parser-perl
              expect # not mentioned in buildroot deps
              file
              findutils
              flock
              glib # not mentioned; not sure if necessary
              glibc # transitively mentioned: debian build-essential
              gnumake
              gnused
              gnutar
              gzip
              libxcrypt # not mentioned in buildroot deps; required for host-mkpasswd
              ncurses.dev # optional
              patch
              perl
              pkg-config # not mentioned, unsure if necessary
              rsync
              swig
              unzip
              wget
              which
            ] ++ pkgs.linux.nativeBuildInputs);
          shellHook = ''
            # The host-uboot-tools package uses objcopy from the shells OBJCOPY var
            # Since the var is set to OBJCOPY=objcopy the buildroot provided
            # CROSS_COMPILE path is ignored hence the script is using the wrong objcopy
            unset $OBJCOPY
          '';
        }).env;
      };
      flake = {
      };
    };
}
