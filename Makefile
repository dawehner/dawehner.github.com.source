all: build deploy
build: build-blog build-podcasts
  
build-blog:
	nix-shell -p hugo --command hugo
build-podcasts:
	cd podcasts && PUBLIC_URL=podcasts npx elm-app build && cd .. && rm -Rf public/podcasts && mkdir -p public/podcasts && cp -r podcasts/build/* public/podcasts/


deploy: build
	nix-shell -p hugo --command './deploy.sh "deploy"'

serve:
	nix-shell -p hugo --command 'hugo server'
