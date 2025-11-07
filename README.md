# Omakub Menu Topbar Extension

GNOME Shell extension that adds the [Omakub](https://omakub.org) icon to the topbar for quick menu access.

## Installation

### Automated (for Omakub post-install scripts)

```bash
git clone https://github.com/Kasui92/omakub-menu-topbar-extension.git /tmp/omakub-ext
cd /tmp/omakub-ext
make local
cd -
rm -rf /tmp/omakub-ext
```

Then restart GNOME Shell:

- **Xorg**: `Alt+F2` → type `r` → Enter
- **Wayland**: logout/login or `killall -3 gnome-shell`

### Manual Installation

```bash
git clone https://github.com/Kasui92/omakub-topbar-extension.git
cd omakub-topbar-extension
make local
```

Restart GNOME Shell and the extension will be enabled automatically.

## Development

Install for development (without auto-enabling):

```bash
make dev        # Install extension files
```

Restart GNOME Shell, then:

```bash
make enable     # Enable the extension
```

## Available Commands

**Development:**

- `make dev` - Install in development mode (manual enable required)
- `make enable` - Enable the extension
- `make disable` - Disable the extension
- `make logs` - Show real-time extension logs

**Production:**

- `make local` - Install and enable automatically (for end users)
- `make build` - Create .zip package for distribution
- `make uninstall` - Disable and remove completely

**Cleanup:**

- `make clean` - Remove build artifacts

## Uninstall

```bash
make uninstall
```

## Customization

Edit `extension.js` to change:

- Command triggered on click (default: `omakub-menu`)
- Icon color (edit `icon.svg`)
- Icon size and spacing
