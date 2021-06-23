let
  nixpkgsSrc = builtins.fetchTarball {
    url =
      "https://github.com/nixos/nixpkgs/archive/7e567a3d092b7de69cdf5deaeb8d9526de230916.tar.gz"; # refs/heads/nixos-unstable
    sha256 = "0gnbxg435pnp727gbakifqkjnf2pm7qsq2b6767rj4si4w60v96v";
  };

in import nixpkgsSrc { }
