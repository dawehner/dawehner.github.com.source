format:
	nix-shell -p dhall --command 'dhall format --inplace config.dhall'

build: format
	nix-shell -p dhall-json --command 'dhall-to-yaml  < config.dhall > config.yml'

