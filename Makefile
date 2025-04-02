ROOT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
ROOT_DOT  := $(ROOT_PATH)/dot
ROOT_XDG  := $(ROOT_PATH)/xdg
XDG_CONFIG_HOME	?= $(HOME)/.config

.PHONY: make_dir clean deploy

VSCODE_CONFIG := ${HOME}/Library/Application\ Support/Code/User
vscode-remove-directory/%:
	# 初回にはディレクトリとしておいてあるのでunlinkだと消せなかった
	# なので、symlinkならunlinkそうでないならrmdirする
	if [ -L $(VSCODE_CONFIG)/$* ]; then \
	  unlink $(VSCODE_CONFIG)/$*; \
	else \
	  rmdir $(VSCODE_CONFIG)/$*; \
	fi

deploy-vscode:
	make vscode-remove-directory/snippets
	# make remove-directory/extensions
	ls .vscode | grep -v extensions | xargs -I{} ln -fnsv $(ROOT_PATH)/.vscode/{} $(VSCODE_CONFIG)
	ln -fnsv $(ROOT_PATH)/.vscode/extensions.json $(HOME)/.vscode/extensions/extensions.json

deploy: make_dir clean ## Deploy dot files
	@echo -e "\033[33mdotfiles deploying\033[0m"
	make deploy-vscode
	@cd $(ROOT_DOT); ls -A | xargs -I{} ln -fnsv $(ROOT_DOT)/{}  $(HOME)
	@cd $(ROOT_XDG); ls    | xargs -I{} ln -fnsv $(ROOT_XDG)/{}/ $(XDG_CONFIG_HOME)

make_dir: ## Make XDG_CONFIG_HOME directory
	@mkdir -p $(XDG_CONFIG_HOME)

clean: ## Clean dot files. If no file then output Error but no problem
	@echo -e '\033[33mdotfiles cleaning\033[0m'
	-@cd $(ROOT_DOT); ls -A | xargs -I{} sh -c 'ls -lA $(HOME)/{} | grep "\->" && unlink $(HOME)/{}' 2> /dev/null
	-@cd $(ROOT_XDG); ls    | xargs -I{} sh -c 'ls -ld $(XDG_CONFIG_HOME)/{} | grep "\->" && unlink $(XDG_CONFIG_HOME)/{}' 2> /dev/null

help: ## Display help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z%\/\._-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

-include makefiles/*.mk
