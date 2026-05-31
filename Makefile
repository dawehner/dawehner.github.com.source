all: build deploy
build: dhall-build build-blog build-podcasts

build-blog:
	nix shell nixpkgs#hugo --command hugo

build-podcasts: export PUBLIC_URL = podcasts

build-podcasts:
	cd podcasts && nix shell nixpkgs#nodejs nixpkgs#elmPackages.elm --command sh -c "npm install && npx vite build" \
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
	&& nix shell nixpkgs#remarshal --command json2toml -i hugo.json -o hugo.toml \
	&& rm hugo.json
