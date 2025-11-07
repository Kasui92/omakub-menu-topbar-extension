# Omakub Topbar Menu Extension

GNOME Shell extension that adds a topbar icon with system actions.

## Development Setup

Install and test locally:

```bash
make dev        # Install extension files
```

Restart GNOME Shell:

- Xorg: `Alt+F2` → type `r` → Enter
- Wayland: logout/login or `killall -3 gnome-shell`

```bash
make enable     # Enable the extension
```

## Available Commands

```bash
make dev        # Install in development mode
make enable     # Enable the extension
make disable    # Disable the extension
make uninstall  # Disable and remove completely
make logs       # Show real-time logs
make build      # Create .zip package
make clean      # Remove build artifacts
```

## Uninstall

```bash
make uninstall
```
