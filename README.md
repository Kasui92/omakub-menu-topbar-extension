# Omakub Menu Topbar Extension

GNOME Shell extension that adds the [Omakub](https://omakub.org) icon to the topbar.

## Installation

```bash
git clone https://github.com/Kasui92/omakub-menu-topbar-extension.git
cd omakub-menu-topbar-extension
make local
```

Restart GNOME Shell:

- **X11**: `Alt+F2` → `r` → Enter
- **Wayland**: logout/login

## Commands

```bash
make local      # Install and enable
make uninstall  # Remove extension
make build      # Create .zip package
```

## Development

```bash
make dev        # Install without enabling
make enable     # Enable extension
make disable    # Disable extension
make logs       # Show real-time logs
```

## Customization

Edit `extension.js` to change the command (default: `omakub-menu`).
Edit `icon.svg` to change icon color and style.
