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

- Natural Scrolling: Disabled

### Appearance

- Appearance: Dark

### Yabai (tiling window manager)

Install via Homebrew:

```sh
brew install yabai skhd FelixKratz/formulae/borders
```

Symlink configs (also add these lines to `install.zsh` on a new Mac):

```sh
mkdir -p ~/.config/yabai ~/.config/skhd
ln -sf ~/dotfiles/.config/yabai/yabairc ~/.config/yabai/yabairc
ln -sf ~/dotfiles/.config/skhd/skhdrc ~/.config/skhd/skhdrc
```

Start services:

```sh
yabai --start-service
skhd --start-service
```

Grant **skhd** permissions in System Settings → Privacy & Security:

1. **Accessibility** — enable `skhd` (add `/Applications/skhd.app` if missing)
2. **Input Monitoring** — approve when prompted after pressing a hotkey

After `brew upgrade skhd`, re-toggle Accessibility (macOS invalidates the grant when the binary changes). Check `~/Library/Logs/skhd.log` if hotkeys stop working; look for `Event tap creation failed` or `Stale TCC grant detected`.

Optional scripting addition (needed for creating spaces, moving windows between displays, etc.):

```sh
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
sudo yabai --load-sa
```

Re-run `sudo yabai --load-sa` after each `brew upgrade yabai`.

### Keyboard > Karabiner-Elements

skhd bindings use `alt` (Option). If Karabiner remaps `left_option` to `left_command` without swapping the keys back, skhd never sees Option presses and yabai hotkeys will not work.

Apply these **Simple Modifications** for all devices (built-in and external keyboards):

| From | To |
|------|----|
| `caps_lock` | `left_command` |
| `left_command` | `left_option` |
| `left_option` | `left_command` |

This swaps Command and Option so the physical key in the Option position sends `alt` to skhd, while Caps Lock acts as Command. The yabai config also uses `mouse_modifier alt` for click-drag window move/resize.

## Wispr Flow

### Mouse Bindings

| Action | Button |
|--------|--------|
| Hands-free mode | Mouse 4 |
| Enter rebind | Mouse 5 |
