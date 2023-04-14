# dotfiles

Install GNU stow:

Debian like:
```
apt install stow
```

RedHat like:
```
dnf install stow
```

```
git clone git@github.com:maureliofs/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow */ # Everything
stow i3 # Just i3 config
```
