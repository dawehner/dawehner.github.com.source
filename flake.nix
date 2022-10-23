{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
    flake-utils-plus.url = github:gytis-ivaskevicius/flake-utils-plus;

    # Website template
    theme = {
      url = github:mobybit/hugo-natrium-theme;
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, flake-utils-plus, ... }:
    flake-utils-plus.lib.mkFlake {
      inherit self inputs;

      outputsBuilder = (channels:
        let
          pkgs = channels.nixpkgs; # quicker alias
        in {

          home = pkgs.stdenv.mkDerivation {
            name = "daniel.town"; # our package name, irrelevant in this case
            src = ./.;
            buildPhase = ''
              mkdir -p themes
              ln -s ${inputs.theme} themes/hugo-natrium-theme
              ${pkgs.hugo}/bin/hugo --minify
            '';
            installPhase = ''
              cp -r public $out
            '';
            meta = with pkgs.lib; {
              description = "daniel.town";
              platforms = platforms.all;
            };
          };

        });
    };
}
