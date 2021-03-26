FROM nixos/nix as builder

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update

COPY . /app
WORKDIR /app
ENV HUGO_BASEURL=https://daniel-town.k8s.daniel.town
RUN nix-shell -p gnumake --command "make build-blog"

FROM nginx:1.13.12-alpine
 
COPY --from=builder /app/public/ /usr/share/nginx/html
