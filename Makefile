UUID = omakub-topbar-menu@omakasui.org
EXTENSION_DIR = $(HOME)/.local/share/gnome-shell/extensions/$(UUID)
FILES = extension.js metadata.json icon.svg

.PHONY: help
help:
	@echo "make dev        Install for development"
	@echo "make enable     Enable extension"
	@echo "make disable    Disable extension"
	@echo "make local      Install and enable"
	@echo "make build      Create .zip package"
	@echo "make uninstall  Remove extension"
	@echo "make logs       Show logs"
	@echo "make clean      Remove build files"

.PHONY: dev
dev:
	@mkdir -p $(EXTENSION_DIR)
	@cp $(FILES) $(EXTENSION_DIR)/
	@echo "✓ Installed. Restart GNOME Shell, then: make enable"

.PHONY: enable
enable:
	@gnome-extensions enable $(UUID)

.PHONY: disable
disable:
	@gnome-extensions disable $(UUID)

.PHONY: local
local:
	@mkdir -p $(EXTENSION_DIR)
	@cp $(FILES) $(EXTENSION_DIR)/
	@gext enable $(UUID)
	@echo "✓ Installed and enabled. Restart GNOME Shell."

.PHONY: build
build:
	@mkdir -p build
	@cp $(FILES) build/
	@cd build && zip -q -r ../$(UUID).shell-extension.zip *
	@rm -rf build
	@echo "✓ Created $(UUID).shell-extension.zip"

.PHONY: uninstall
uninstall:
	@gnome-extensions disable $(UUID) 2>/dev/null || true
	@gnome-extensions uninstall $(UUID) 2>/dev/null || true
	@rm -rf $(EXTENSION_DIR)
	@echo "✓ Uninstalled"

.PHONY: logs
logs:
	@journalctl -f -o cat /usr/bin/gnome-shell | grep -i --line-buffered "$(UUID)\|js error"

.PHONY: clean
clean:
	@rm -f $(UUID).shell-extension.zip
	@rm -rf build
	@echo "✓ Cleaned"