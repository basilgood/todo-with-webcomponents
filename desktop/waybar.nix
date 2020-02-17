{ config, lib, pkgs, ... }:
let
  cfg = config.programs.waybar;
in
{
  config = {
    environment.etc."xdg/waybar/config".text = with pkgs; ''
      {
        "layer": "bottom",
        "position": "bottom",
        "height": 22,
        "modules-left": ["sway/workspaces", "sway/mode"],
        "modules-center": ["clock"],
        "modules-right": ["network", "cpu", "temperature#gpu", "memory", "battery", "pulseaudio", "tray"],
        "sway/workspaces": {
          "all-outputs": false,
          "format": "{name}"
        },
        "sway/mode": {
            "format": " {}"
        },
        "sway/workspaces": {
            "format": "{name}",
            "disable-scroll": false
        },
        "clock": {
           "tooltip-format": "{:%Y-%m-%d | %H:%M}",
           "format-alt": "{:%Y-%m-%d}"
        },
        "tray": {
            // "icon-size": 21,
            "spacing": 10
        },
        "cpu": {
            "format": "{usage}% ",
            "tooltip": false
        },
        "temperature#gpu": {
          "thermal-zone": 2,
          "hwmon-path": "/sys/class/hwmon/hwmon1/temp1_input",
          "critical-threshold": 80,
          "format-critical": "{temperatureC}°C ",
          "format": "{temperatureC}°C "
        },
        "battery": {
            "states": {
                "warning": 30,
                "critical": 15
            },
            "format": "{capacity}% {icon}",
            "format-icons": ["", "", "", "", ""]
        },
        "network": {
          "format": "{icon}",
          "format-alt": "{ipaddr}/{cidr} {icon}",
          "format-alt-click": "click-right",
          "format-icons": {
            "wifi": ["", "" ,""],
            "ethernet": [""],
            "disconnected": [""]
          },
          "tooltip": false
        },
        "pulseaudio": {
          "format": "{volume}% {icon}",
          "format-bluetooth": "{volume}% {icon}",
          "format-muted": "",
          "format-icons": {
              "headphones": "",
              "handsfree": "",
              "headset": "",
              "phone": "",
              "portable": "",
              "car": "",
              "default": ["", ""]
          },
          "scroll-step": 5,
          "on-click-right": "pactl set-sink-mute alsa_output.pci-0000_38_00.6.analog-stereo toggle",
          "tooltip": false
        }
      }
    '';
    environment.etc."xdg/waybar/style.css".text = with pkgs; ''
      * {
        margin-top: 1px;
        border-top: 0;
        border-radius: 0;
        font-family: monospace;
        font-size: 12px;
        min-height: 0;
      }
      window {
        background: transparent;
      }
      window#waybar.solo {
          color:      rgba(217, 216, 216, 1);
          background: rgba(35, 31, 32, 0.85);
      }
      #workspaces {
        margin-left: 12px;
        border-radius: 5px;
        padding: 0 12px;
        background: #1e222c;
      }
      #workspaces button {
        padding: 0 2px;
        color: #bfb8a8;
      }
      #workspaces button.focused {
        color:  #00736f;
      }
      #workspaces button:hover {
        box-shadow: none;
        text-shadow: none;
        border-color: transparent;
        background: transparent;
      }
      #clock {
        color: #bfb8a8;
        background: #1e222c;
        padding: 0 12px;
        border-radius: 5px;
      }
      #pulseaudio {
        background: #5c7ea1;
      }
      #memory {
        background: #ad6179;
      }
      #temperature.gpu {
        background: #0b7054;
      }
      #cpu {
        background: #b7bd73;
      }
      #battery {
        background: white;
      }
      #battery.charging {
        background: green;
      }
      #network {
        background: #80709c;
      }
      #pulseaudio, #memory, #cpu, #temperature.gpu, #battery, #network, #tray {
        color: #1E1F23;
        border-radius: 5px;
        margin: 0 4px;
        padding: 0 12px;
      }
    '';
  };
}
