{
  description = "danihek's wallpapers";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, dh-wallpapers }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      defaultPackage.${system} = pkgs.stdenv.mkDerivation {
        name = "dh-wallpapers";
        src = dh-wallpapers;
        buildInputs = [ pkgs.git ];
        phases = [ "unpackPhase" "installPhase" ];
        installPhase = ''
          mkdir -p $out/.wallpapers
          cp -r ./content/* $out/.wallpapers/
        '';
      };
    };
}
