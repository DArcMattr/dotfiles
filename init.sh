#!/usr/bin/env zsh
# vim:ft=zsh
# only idempotent commands here so far
# TODO: translate to ansible

DOT_CONFIG=${XDG_CONFIG_HOME:=${HOME}/.config}
CONTRIB="${HOME}${CONTRIB}"
DOTFILES="${HOME}/dotfiles"
LOCAL="${HOME}/.local"

xdg-user-dirs-update
mkdir -p ${CONTRIB} "${HOME}/.local/bin" "${DOT_CONFIG}" \
	"${HOME}/.ssh/hosts" "${HOME}/.ssh/sockets" "${HOME}/.pandoc"

tic -x "${DOTFILES}/tmux-256color.terminfo"

find "${DOTFILES}/symlinks/" -type f -printf '%p %P\n' | \
	while read source link; do \
		ln -sf $source $link; \
	done
find "${DOTFILES}/xdg/" -mindepth 1 -maxdepth 1 -type d -exec ln -sf "{}" "${DOT_CONFIG}/" \;

(
	sudo corepack enable
	corepack prepare pnpm@latest --activate
	# pnpm env use latest
	cd "${DOTFILES}"
	pnpm install
	ln -s "${DOTFILES}/node_modules" "${LOCAL}/lib"
)

cd ~
git clone --recursive https://github.com/sorin-ionescu/prezto.git \
	"${ZDOTDIR:-${HOME}}/.zprezto"

(
	cd /tmp
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x /tmp/wp-cli.phar
	mv /tmp/wp-cli.phar "${LOCAL}/bin/wp"
)

curl -L https://cpanmin.us | perl - App::cpanminus

(
	zsh ${DOTFILES}/init_libs.sh

	grab_composer
	grab_pips
	grab_gems
	grab_git -d "${CONTRIB}/ctags"               -r https://github.com/universal-ctags/ctags.git
	grab_git -d "${CONTRIB}/tmux"                -r https://github.com/tmux/tmux.git
	grab_git -d "${CONTRIB}/autoenv"             -r https://github.com/zpm-zsh/autoenv.git -n
	grab_git -d "${CONTRIB}/luarocks"            -r https://github.com/luarocks/luarocks -n
	grab_git -d "${CONTRIB}/zsh-completions"     -r https://github.com/zsh-users/zsh-completions -n

	cpanm -n --installdeps -l ${LOCAL} Neovim::Ext

	cd "${CONTRIB}/luarocks" && \
		git lasttagcheckout && \
		./configure --prefix="${LOCAL}" --with-lua-include=/usr/include &&
		make install clean
)
