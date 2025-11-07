import St from "gi://St";
import GObject from "gi://GObject";
import Gio from "gi://Gio";
import * as Main from "resource:///org/gnome/shell/ui/main.js";
import * as PanelMenu from "resource:///org/gnome/shell/ui/panelMenu.js";

const TopbarButton = GObject.registerClass(
  class TopbarButton extends PanelMenu.Button {
    _init(extensionPath) {
      super._init(0.0, "Topbar Icon", false);

      // Remove all default styling and behavior
      this.remove_style_class_name("panel-button");
      this.style = "padding: 0; margin: 0 0 0 14px;";
      this.reactive = true;
      this.can_focus = false;
      this.track_hover = false;

      // Load icon from local file
      let iconPath = extensionPath + "/icon.svg";
      let gicon = Gio.icon_new_for_string(iconPath);

      let icon = new St.Icon({
        gicon: gicon,
        icon_size: 14,
      });

      let box = new St.Bin({
        style: "padding: 0; margin: 0 0 0 0;",
        child: icon,
      });

      this.add_child(box);

      // Force icon color to white
      icon.set_style("-st-icon-style: symbolic;");
      icon.add_style_class_name("system-status-icon");

      this.connect("button-press-event", () => {
        this._executeCommand();
        return true;
      });
    }

    _executeCommand() {
      try {
        let command = ["omakub-menu"];

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

    Main.panel.addToStatusArea("omakub-topbar-button", this._button, 0, "left");
  }

  disable() {
    if (this._button) {
      this._button.destroy();
      this._button = null;
    }
  }
}
