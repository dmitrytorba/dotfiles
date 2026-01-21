# Install

## New machine

```sh
sudo apt install tmux emacs zsh
./dotfiles/install.zsh
```

## Systemd

```sh
mkdir -p .config/systemd/user
cp dotfiles/.config/systemd/user/syncthing.service .config/systemd/user/
systemctl --user enable syncthing
systemctl --user start syncthing
systemctl --user status syncthing
```

# Manual Configurations

## Gnome Tweaks

### Keyboard > Layout > Additional Layout Options

- Caps Lock behavior
  - Make Caps Lock an additional Ctrl
- Ctrl position
  - Swap Left Alt with Left Ctrl

## Gnome Settings

### Keyboard > Keyboard Shortcuts > View and Customize > Navigation

- Switch applications
  - Disabled
- Switch windows
  - Ctrl+Tab

## Macintosh Settings

### Trackpad > Scroll & Zoom

- Natural Scrolling
  - Disabled

### Appearance

- Appearance
  - Dark



### Keyboard > Keyboard Shortcuts > Modifier Keys > Karabiner Virtual Keyboard



#### Karabiner-Elements for External Keyboard

Modifier Keys > caps_lock ->  Modifier Keys > left_command
Modifier Keys > left_option ->  Modifier Keys > left_command
