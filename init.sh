#!/usr/bin/env zsh
# vim:ft=zsh
# only idempotent commands here so far
# TODO: translate to ansible

CONTRIB="${HOME}/contrib"
DOTFILES="${HOME}/dotfiles"
LOCAL="${HOME}/.local"

mkdir -p ${CONTRIB} "${HOME}/.local/bin" "${HOME}/.config" "${HOME}/.cache/zsh" \
	"${HOME}/.ssh/hosts" "${HOME}/.ssh/sockets" "${HOME}/.pandoc"

find "${DOTFILES}/symlinks/" -type f -printf '%p %P\n' | \
	while read source link; do \
		ln -sf $source $link; \
	done
find "${DOTFILES}/xdg/" -mindepth 1 -maxdepth 1 -type d -exec ln -sf "{}" "${XDG_CONFIG_HOME:-$HOME/.config}/" \;

(
	sudo corepack enable
	corepack prepare pnpm@latest --activate
	pnpm setup
	cd
	pnpm completion zsh >! "${LOCAL}/share/zsh/site-functions/_pnpm"
	pnpm install -g \
		@agentclientprotocol/claude-agent-acp \
		@stylelint/language-server \
		bash-language-server \
		intelephense \
		quicktype \
		sass \
		stylelint \
		svgo \
		typescript \
		typescript-language-server \
		vscode-langservers-extracted
)

(
  cd ~
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-${HOME}}/.zprezto"
  cd "${ZDOTDIR:-${HOME}}/.zprezto"
  git submodule add -f https://github.com/zpm-zsh/autoenv.git contrib/autoenv
)

(
	cd /tmp
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x /tmp/wp-cli.phar
	mv /tmp/wp-cli.phar "${LOCAL}/bin/wp"
	${LOCAL}/bin/wp package install git@github.com:schlessera/wp-cli-psysh.git
)

curl -L https://cpanmin.us | perl - App::cpanminus

(
	zsh ${DOTFILES}/init_libs.sh

	grab_composer
	grab_pips
	grab_gems
	grab_git -d "${CONTRIB}/ctags"               -r https://github.com/universal-ctags/ctags.git
	grab_git -d "${CONTRIB}/neovim"              -r https://github.com/neovim/neovim.git -n
	grab_git -d "${CONTRIB}/tmux"                -r https://github.com/tmux/tmux.git
	grab_git -d "${CONTRIB}/luarocks"            -r https://github.com/luarocks/luarocks -n
	# -- manually build the following TODO: script these
	grab_git -d "${CONTRIB}/vscode-php-debug"    -r https://github.com/xdebug/vscode-php-debug.git -n
	grab_git -d "${CONTRIB}/vscode-js-debug"     -r https://github.com/microsoft/vscode-js-debug.git -n
	grab_git -d "${CONTRIB}/lua-language-server" -r https://github.com/LuaLS/lua-language-server.git -n

	cpanm -n --installdeps -l ${LOCAL} Neovim::Ext PLS

	cd "${CONTRIB}/luarocks" && \
		git lasttagcheckout && \
		./configure --prefix="${LOCAL}" --with-lua-include=/usr/include &&
		make install clean
)
