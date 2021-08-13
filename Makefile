MAKEFLAGS += --silent
ARGS = $(filter-out $@,$(MAKECMDGOALS))

.PHONY: build clean k3d_list_images local-k3d setup test_k3d_registry test

all: setup build
	echo "Done"

build clean k3d_list_images local-k3d setup test_k3d_registry test:
	./scripts/$@.sh

-include include.mk
