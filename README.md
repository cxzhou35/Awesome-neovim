# Awesome-neovim

Here is my personal Neovim configuration. If this is helpful to you, please give me a star ⭐️.

## Screenshots

<div align=center><img src="https://gitee.com/vercent_zhou/picgo-md/raw/master/image/20230209171015.png" style="zoom:50%" alt="fig"></div> 

## Table of contents

- [`init.lua`](./init.lua): Import all configuration modules for Neovim.
- [`lua`](./lua/): Include basic Neovim configurations.
- [`after`](./after/plugin/): Include all plugin configurations.
- [`plugin`](./plugin/packer_compiled.lua): Include files automatically created by Packer.
- [`res`](./res/): Include all files modified by Zicx.
- [`snippets`](./snippets/friendly-snippets/): Include all code snippets.(Python, C/C++, Go, Lua etc.)

## Requirements

- [Neovim 0.8+](https://github.com/neovim/neovim/releases)
- [Packer.nvim](https://github.com/wbthomason/packer.nvim): A use-package inspired plugin manager for Neovim.
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads): Iconic font aggregator, collection, and patcher.
- [Ripgrep](https://github.com/BurntSushi/ripgrep): A line-oriented search tool.
- [Python integration](https://neovim.io/doc/user/provider.html#provider-nodejs): To use python remote-plugins with Neovim.

    ```python
    python3 -m pip install --user pynvim
    python3 -m pip install --user neovim
    ```

- [Node.js integration](https://neovim.io/doc/user/provider.html#provider-python): To use javascript remote-plugins with Neovim.

    ```shell
    npm install -g neovim
    ```

> **Note**
>
> After you have installed all requirements, you can relaunch Neovim and type `:checkhealth` to see if your Neovim system is up-to-date.

### Optional Tools

- [Btop](https://github.com/aristocratos/btop): A monitor of resources.
- [Lazygit](https://github.com/jesseduffield/lazygit): Simple terminal UI for git commands.
- [Ranger](https://github.com/ranger/ranger): A VIM-inspired filemanager for the console.

## Setup

1. Clone repo:
    ```bash
    cd ~ # or any path you like

    git clone https://github.com/Xuer04/Awesome-neovim.git neovim

    mkdir -p ~/.config/nvim

    cd ~/.config/nvim

    cp -r ~/neovim/* .
    ```

2. Install **Plugins**: Relaunch Neovim and type `:PackerInstall` to install all plugins.

3. Install **LSP Server**: Relaunch Neovim and type `:LspInstall [server]` to install corresponding lsp server.

    > You can get more detailed information [here](https://microsoft.github.io/language-server-protocol/implementors/servers/).

4. Install **Treesitter**: Relaunch Neovim and type `:TSInstall [language]` to install corresponding language.
 
    > You can get more detailed information [here](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages).

## Features

📝 TODO

## Keymaps

📝 TODO

---

If you meet some problems, please contact [Zicx](https://github.com/Xuer04) or raise an [issue](https://github.com/Xuer04/Awesome-neovim/issues).

Neovim is worth a try! 😺

