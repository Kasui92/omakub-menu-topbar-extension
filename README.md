# Omakub Menu Topbar Extension

GNOME Shell extension that adds the [Omakub](https://omakub.org) icon to the topbar.

## Installation

- Use the Quick Install :
  ```bash
  curl -fsSL https://omakasui.org/omakub-menu-topbar-extension | bash
  ```
- Build it yourself via `make install` or `make dev`.

Then restart GNOME Shell:

- **X11**: `Alt+F2` → `r` → Enter
- **Wayland**: logout/login

## Development

```bash
make dev        # Install extension files
```

Restart GNOME Shell, then:

```bash
make enable     # Enable the extension
```

## Uninstall

```bash
make uninstall
```

## Customization

The extension now includes a **Preferences panel** for easy customization.

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Kasui92/omakub-menu-topbar-extension/blob/main/LICENSE) file for details.
