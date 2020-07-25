all: build deploy
build: dhall-build build-blog build-podcasts
  
build-blog:
	nix-shell -p hugo --command hugo

build-podcasts: export PUBLIC_URL = podcasts

build-podcasts:
	cd podcasts && npx elm-app build && cd .. && rm -Rf public/podcasts && mkdir -p public/podcasts && cp -r podcasts/build/* public/podcasts/

deploy: build
	nix-shell -p hugo --command './deploy.sh "deploy"'

deploy-action: build-blog
	nix-shell -p hugo --command './deploy.sh "deploy"'

serve:
	nix-shell -p hugo --command 'hugo server'

dhall-format:
	nix-shell -p dhall --command 'dhall format --inplace config.dhall'

dhall-build: dhall-format
	nix-shell -p dhall-json remarshal --command 'dhall-to-json < config.dhall > config.json && json2toml -i config.json -o config.toml --preserve-key-order'
