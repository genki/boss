TAG := s21g/boss

default: image

image: image.ok
image.ok: Dockerfile boss
	docker build -t $(TAG) .
	touch image.ok

push: image.ok
	make -C .. auth
	docker push $(TAG)

run: image.ok
	d -p21081:21081 -v/var/run/docker.sock:/var/run/docker.sock $(TAG)

.PHONY: run
