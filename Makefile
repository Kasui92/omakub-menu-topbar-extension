# Makefile for GNOME Shell Extension

UUID = omakub-topbar-menu@omakasui.org
EXTENSION_DIR = $(HOME)/.local/share/gnome-shell/extensions/$(UUID)
FILES = extension.js metadata.json icon.svg

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make dev        - Install extension in development mode"
	@echo "  make enable     - Enable the extension"
	@echo "  make disable    - Disable the extension"
	@echo "  make uninstall  - Disable and completely remove the extension"
	@echo "  make build      - Build a .zip package"
	@echo "  make install    - Build and install from .zip"
	@echo "  make clean      - Remove build artifacts"
	@echo "  make logs       - Show extension logs in real-time"

.PHONY: dev
dev:
	@mkdir -p $(EXTENSION_DIR)
	@cp $(FILES) $(EXTENSION_DIR)/
	@echo "Installed. Restart GNOME Shell (Alt+F2 → r) then run: make enable"

.PHONY: enable
enable:
	@gnome-extensions enable $(UUID)

.PHONY: disable
disable:
	@gnome-extensions disable $(UUID)

.PHONY: build
build:
	@mkdir -p build
	@cp $(FILES) build/
	@cd build && zip -r ../$(UUID).shell-extension.zip *
	@rm -rf build
	@echo "Created $(UUID).shell-extension.zip"

.PHONY: install
install: build
	@gnome-extensions install --force $(UUID).shell-extension.zip
	@echo "Installed. Restart GNOME Shell then run: make enable"

.PHONY: uninstall
uninstall:
	@gnome-extensions disable $(UUID) 2>/dev/null || true
	@gnome-extensions uninstall $(UUID) 2>/dev/null || true
	@rm -rf $(EXTENSION_DIR)
	@echo "Extension uninstalled and removed"

.PHONY: logs
logs:
	@echo "Watching GNOME Shell logs (Ctrl+C to stop)..."
	@journalctl -f -o cat /usr/bin/gnome-shell | grep -i --line-buffered "$(UUID)\|js error"

.PHONY: clean
clean:
	@rm -f $(UUID).shell-extension.zip
	@rm -rf $(EXTENSION_DIR)