CONTAINER=nginx_builder_xenial

all: nginx

build:
	docker build -t $(CONTAINER) --build-arg http_proxy=http://host.docker.internal:3142/ .

nginx: build
	docker run --rm -v "/Volumes/Dane zaszyfrowane/Klucze GPG - Ubuntu/":/root/.gnupg -it $(CONTAINER) bash -c ./build-user.sh

shell:
	docker run --rm -it $(CONTAINER)

clean:
	docker rmi $(CONTAINER)
