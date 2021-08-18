#!/usr/bin/env zsh
# vim:ft=zsh
# only idempotent commands here so far
# TODO: translate to ansible

DOT_CONFIG=${XDG_CONFIG_HOME:=${HOME}/.config}
CONTRIB="${HOME}${CONTRIB}"
DOTFILES="${HOME}/dotfiles"

mkdir -p ${CONTRIB} "${HOME}/.local/bin" "${DOT_CONFIG}" \
	"${HOME}/.ssh/{hosts,sockets}" "${HOME}/.pandoc"
tic -x "${DOTFILES}/tmux-256color.terminfo"

find "${DOTFILES}/symlinks/" -type f -printf '%p %P\n' | \
	while read source link; do \
		ln -sf $source $link \
	done
find "${DOTFILES}/xdg/" -mindepth 1 -maxdepth 1 -type d -exec ln -sf "{}" "${DOT_CONFIG}/" \;

cd ~
git clone --recursive https://github.com/sorin-ionescu/prezto.git \
	"${ZDOTDIR:-${HOME}}/.zprezto"

(
	zsh ${DOTFILES}/init_libs.sh

	grab_composer
	grab_pips
	grab_gems
	grab_git -d "${CONTRIB}/the_silver_searcher" -r https://github.com/ggreer/the_silver_searcher.git -b master
	grab_git -d "${CONTRIB}/ctags"               -r https://github.com/universal-ctags/ctags.git      -b master
	grab_git -d "${CONTRIB}/tmux"                -r https://github.com/tmux/tmux.git
	grab_git -d "${CONTRIB}/autoenv"             -r https://github.com/zpm-zsh/autoenv.git -n
	grab_git -d "${CONTRIB}/luarocks"            -r https://github.com/luarocks/luarocks -n

	cpanm -n -l ${LOCAL} Neovim::Ext

	cd "${CONTRIB}/luarocks" && \
		git lasttagcheckout && \
		./configure --prefix="${LOCAL}" --with-lua-include=/usr/include &&
		make install clean

	NPM_PACKAGES= "${LOCAL}/node_modules"
	mkdir -p "${NPM_PACKAGES}"
	cd "${LOCAL}"
	npm install
)
