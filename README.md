# Neovim configuration

forked from "LunarVim/Neovim-from-scratch".


## Try out this config

Make sure to remove or move your current `nvim` directory

**IMPORTANT** requires `Neovim 0.6 release` version
```
git clone https://github.com/volkangulen/nvim.git ~/.config/nvim
```

**REQUIREMENTS**

Ripgrep is required for Telescope live_grep
Installation:
-  **Debian/Ubuntu/Mint**
    ```
    $ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
    $ sudo dpkg -i ripgrep_13.0.0_amd64.deb
    ```

-  **Arch Linux**
    ```
    $ pacman -S ripgrep
    ```
\
&nbsp;

Run `nvim` and wait for the plugins to be installed

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```
---
