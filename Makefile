ROOT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
ROOT_DOT := $(ROOT_PATH)/dot
ROOT_XDG := $(ROOT_PATH)/xdg
XDG_CONFIG_HOME ?= $(HOME)/.config

.PHONY: deploy make_dir clean

deploy:
	@cd $(ROOT_DOT); ls -aA | xargs -I{} ln -fnsv $(ROOT_DOT)/{} $(HOME)/
	@cd $(ROOT_XDG); ls     | xargs -I{} ln -fnsv $(ROOT_XDG)/{} $(XDG_CONFIG_HOME)/

make_dir:
	@mkdir -p $(XDG_CONFIG_HOME)

clean:
	@cd $(ROOT_DOT); ls -aA | xargs -I{} unlink $(HOME)/{}
	@cd $(ROOT_XDG); ls     | xargs -I{} unlink $(XDG_CONFIG_HOME)/{}
