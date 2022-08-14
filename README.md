# My Neovim Configuration

Forked from https://github.com/LunarVim/Neovim-from-scratch.

## Usage

Clone this repository to `~/.config/nvim`. If you have Docker installed, you can run

```bash
sh build.sh
```

to build the container and

```bash
sh dvim
```

to try out this config. You can also add `dvim` to your `PATH`.
Then, run runnin `dnvim` from a directory will mount that directory to `/home` in the container.
The first time you open neovim in the container, you will have to run `:PackerInstall` and then restart to download treesitter stuff.

