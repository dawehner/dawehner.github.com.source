build: build-blog build-podcasts
  
build-blog:
	nix-shell -p hugo --command hugo && mkdir -p public/podcasts/build && cp -r podcasts/build public/podcasts/
build-podcasts:
	cd podcasts && elm-app build

deploy: build
	nix-shell -p hugo --command './deploy.sh "deploy"'
