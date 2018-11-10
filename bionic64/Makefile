CONTAINER=nginx_builder_bionic
NGINX_VERISON=1.12.2

all: build nginx

build:
	docker build -t $(CONTAINER) --build-arg http_proxy=http://host.docker.internal:3142/ .

nginx:
	docker run --rm -v "/Volumes/Dane zaszyfrowane/Klucze GPG - Ubuntu/":/root/.gnupg -it $(CONTAINER) bash -c ./build-user.sh

shell:
	docker run --rm -it $(CONTAINER)

clean:
	docker rmi $(CONTAINER)
