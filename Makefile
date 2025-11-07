# Makefile for GNOME Shell Extension

UUID = omakub-topbar-menu@omakasui.org
EXTENSION_DIR = $(HOME)/.local/share/gnome-shell/extensions/$(UUID)
FILES = extension.js metadata.json icon.svg

.PHONY: dev
dev:
	@echo "Installing in development mode..."
	@mkdir -p $(EXTENSION_DIR)
	@cp $(FILES) $(EXTENSION_DIR)/
	@echo "✓ Development installation complete"
	@echo ""
	@echo "Next steps:"
	@echo "  1. Restart GNOME Shell (Alt+F2 → r on X11, or logout on Wayland)"
	@echo "  2. Run: make enable"

.PHONY: local
local:
	@echo "Installing locally from source..."
	@mkdir -p $(EXTENSION_DIR)
	@cp $(FILES) $(EXTENSION_DIR)/
	@gnome-extensions enable $(UUID) 2>/dev/null || true
	@echo "✓ Local installation complete"
	@echo ""
	@echo "Extension installed and enabled."
	@echo "Restart GNOME Shell to load the extension."

.PHONY: enable
enable:
	@gnome-extensions enable $(UUID)

.PHONY: disable
disable:
	@gnome-extensions disable $(UUID)

.PHONY: build
build:
	@echo "Building extension package..."
	@mkdir -p build
	@cp $(FILES) build/
	@cd build && zip -q -r ../$(UUID).shell-extension.zip *
	@rm -rf build
	@echo "✓ Created $(UUID).shell-extension.zip"

.PHONY: install
install: build
	@gnome-extensions install --force $(UUID).shell-extension.zip
	@echo "Installed. Restart GNOME Shell then run: make enable"

.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	@rm -f $(UUID).shell-extension.zip
	@rm -rf build
	@echo "✓ Cleanup complete"