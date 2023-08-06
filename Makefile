all: build deploy
build: dhall-build build-blog build-podcasts
  
build-blog:
	nix shell nixpkgs#hugo --command hugo

build-podcasts: export PUBLIC_URL = podcasts

build-podcasts:
	cd podcasts && nix run nixpkgs#elmPackages.create-elm-app build \
	&& cd .. && rm -Rf public/podcasts && mkdir -p public/podcasts \
	&& cp -r podcasts/build/* public/podcasts/

deploy: build
	nix shell nixpkgs#hugo --command ./deploy.sh "deploy"

deploy-action: build-blog
	nix shell nixpkgs#hugo --command ./deploy.sh "deploy"

serve:
	nix shell nixpkgs#hugo --command hugo server

dhall-format:
	nix shell nixpkgs#dhall --command dhall format hugo.dhall

dhall-build: dhall-format
	nix shell nixpkgs#dhall-json --command dhall-to-json < hugo.dhall > hugo.json \
	&& nix shell nixpkgs#remarshal --command json2toml -i hugo.json -o config.toml --preserve-key-order
