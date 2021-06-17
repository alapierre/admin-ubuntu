IMAGE_NAME=lapierre/admin-linux
IMAGE_VERSION=0.0.1

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):latest