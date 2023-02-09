# Awesome-neovim

Here is my personal Neovim configuration. If this is helpful to you, please give me a star ⭐️

### Table of contents

- [`init.lua`](./init.lua): Import all configuration modules for Neovim.
- [`lua`](./lua/): Include basic Neovim configurations.
- [`after`](./after/plugin/): Include all plugin configurations.
- [`plugin`](./plugin/packer_compiled.lua: Include files automatically created by Packer.
- [`res`](./res/): Include all files modified by Zicx.
- [`snippets`](./snippets/friendly-snippets/): Include all code snippets.(Python, C/C++, Go, Lua etc.)

### Install Tutorial

```bash
mkdir -p ~/.config

cd ~/.config

git clone https://github.com/Xuer04/Awesome-neovim.git nvim

# install all plugins
# relaunch neovim and type `:PackerInstall`

# install all nvim-lsp server
# relaunch neovim and type `:LspInstall [server]`

# install all tree-sitter
# relaunch neovim and type `:TSInstall [server]`
```

If you meet some problems, please contact [Zicx](https://github.com/Xuer04) or raise an [issue](https://github.com/Xuer04/Awesome-neovim/issues).

Neovim is worth a try! 😺

