# dotfiles

My personal BSPWM config.

![screenshot](https://raw.githubusercontent.com/arifvn/.dotfiles/main/doc/sc.png)

### How to use

1. **Make sure you have already backed up your configurations.**

2. Run following commands.

```bash
git clone git@github.com:arifvn/.dotfiles.git --recursive ~/.dotfiles && cd ~/.dotfiles
./install -p dotbot-yay/yay.py -c arch_packages.conf.yaml && ./install
```

3. Or if you just want to override your configs.

```bash
git clone git@github.com:arifvn/.dotfiles.git --recursive ~/.dotfiles && cd ~/.dotfiles
./install --only link
```
