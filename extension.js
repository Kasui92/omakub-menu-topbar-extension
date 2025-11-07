// extension.js
import St from "gi://St";
import GObject from "gi://GObject";
import Gio from "gi://Gio";
import * as Main from "resource:///org/gnome/shell/ui/main.js";
import * as PanelMenu from "resource:///org/gnome/shell/ui/panelMenu.js";

const TopbarButton = GObject.registerClass(
  class TopbarButton extends PanelMenu.Button {
    _init(extensionPath) {
      super._init(0.0, "Topbar Icon", false);

      // Load icon from local file
      let iconPath = extensionPath + "/icon.svg";
      let gicon = Gio.icon_new_for_string(iconPath);

      let icon = new St.Icon({
        gicon: gicon,
        style_class: "system-status-icon",
      });

      this.add_child(icon);

      this.connect("button-press-event", () => {
        this._executeCommand();
        return true;
      });
    }

    _executeCommand() {
      try {
        // Your command here
        let command = ["notify-send", "Clicked", "Icon was clicked!"];

        Gio.Subprocess.new(command, Gio.SubprocessFlags.NONE);
      } catch (e) {
        console.error("Command execution error:", e);
      }
    }

    destroy() {
      super.destroy();
    }
  }
);

export default class MyExtension {
  constructor(metadata) {
    this._metadata = metadata;
    this._button = null;
  }

  enable() {
    this._button = new TopbarButton(this._metadata.path);

    Main.panel.addToStatusArea("my-topbar-button", this._button, 0, "left");
  }

  disable() {
    if (this._button) {
      this._button.destroy();
      this._button = null;
    }
  }
}
