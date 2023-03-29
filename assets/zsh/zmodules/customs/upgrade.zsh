#!/usr/bin/env zsh

function plugins_upgrade {
	for plugin in ${ZSH_PLUGINS_DIR}/*; do
		echo "Upgrading ${plugin}"
		git -C ${plugin} pull
	done
}
