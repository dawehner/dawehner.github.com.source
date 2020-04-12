all: build deploy
build: build-blog build-podcasts
  
build-blog:
	nix-shell -p hugo --command hugo && mkdir -p public/podcasts/build && cp -r podcasts/build public/podcasts/
build-podcasts:
	cd podcasts && npx elm-app build

deploy: build
	nix-shell -p hugo --command './deploy.sh "deploy"'

serve:
	nix-shell -p hugo --command 'hugo server'
