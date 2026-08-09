# vim-tmux-config

Portable Vim and tmux settings for local use and SSH sessions. The Vim setup
targets Vim 8.1+ so the same baseline works on older Ubuntu hosts and current
macOS hosts.

## Vim setup

Install [vim-plug](https://github.com/junegunn/vim-plug):

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Copy or symlink `.vimrc` to `~/.vimrc`, then install the configured plugins:

```bash
vim +PlugInstall +qall
```

The vimrc starts with the built-in `desert` colorscheme when vim-plug or the
configured colorscheme has not been installed yet.

## Updating an existing installation

After pulling a new vimrc, reload it or restart Vim, then run:

```vim
:PlugUpdate
:PlugClean
```

`PlugUpdate` installs missing plugins and updates configured plugins.
`PlugClean` separately removes plugin directories no longer listed in the
vimrc. Review its list before confirming deletion.

## Navigation

| Mapping | Action |
| --- | --- |
| `<leader>n` | Toggle NERDTree |
| `<leader>N` | Reveal the current file in NERDTree |
| `<leader>p` | Find a file with fzf |
| `<leader>b` | Select an open buffer with fzf |
| `<leader>gs` | Open Fugitive Git status |
| `<leader>gd` | Diff the current file with Git |
| `]c` / `[c` | Move between GitGutter changes |

The leader key is comma.

## LSP workflow

The configuration uses `vim-lsp` without an automatic completion framework.
Open a source file and, if its language server is not already installed, run:

```vim
:LspInstallServer
```

Use `:LspStatus` to confirm the server is running.

| Mapping | Action |
| --- | --- |
| `gd` | Go to definition |
| `gr` | Find references |
| `gs` | Search document symbols |
| `K` | Show hover documentation |
| `<leader>rn` | Rename a symbol |
| `]g` / `[g` | Move between diagnostics |
| `<C-x><C-o>` | Request completion manually |

Signature help is enabled automatically. For C and C++, clangd works best when
the project provides `compile_commands.json`; clangd builds and caches its
symbol index in the background.

## Recovery

Swap and persistent undo are enabled. The vimrc creates these directories when
needed:

```text
~/.vim/swap
~/.vim/undo
```

This allows recovery after a dropped SSH session or an interrupted Vim process.

## macOS shell colors

macOS `ls` colors are configured by the shell, not by Vim. Add this to the
remote Mac's `~/.zshrc` if directory listings are monochrome:

```zsh
export CLICOLOR=1
alias ls='ls -G'
```

Do not hard-code `TERM` in the remote shell configuration. Check the negotiated
terminal with `echo $TERM` and `tput colors` instead.

## tmux setup

Copy or symlink `.tmux.conf` to `~/.tmux.conf`. The configuration advertises
`tmux-256color` and enables true-color passthrough for `xterm-256color` clients.
