MAKEFLAGS += --silent
ARGS = $(filter-out $@,$(MAKECMDGOALS))

.PHONY: skaffold clean k3d_list_images setup test_k3d_registry test

all: setup skaffold test
	echo "Done"

skaffold clean k3d_list_images setup test_k3d_registry test:
	./scripts/$@.sh

-include include.mk
