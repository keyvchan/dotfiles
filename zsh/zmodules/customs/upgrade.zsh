#!/usr/bin/env zsh

function modules_upgrade {

	git -C ${ZSH_MODULES_DIR}/powerlevel10k pull
	git -C ${ZSH_MODULES_DIR}/completions/zsh-completions pull
	git -C ${ZSH_MODULES_DIR}/zsh-autosuggestions pull
}
