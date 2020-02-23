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
          "format": "{:%a %b %d %I:%M %p}",
          "tooltip": false
        },
        "tray": {
         "icon-size": 16,
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
        "memory": {
          "format": "{}% "
        },
        "battery": {
          "states": {
            "good": 95,
            "warning": 30,
            "critical": 15
          },
          "format": "{icon}",
          "format-charging": "",
          "format-plugged": "",
          "format-alt": "{capacity} {time} {icon}",
          "format-good": "{icon}", // An empty format will hide the module
          "format-full": "{icon}",
          "format-icons": ["", "", "", "", ""]
        },
        "network": {
          "format": "{icon}",
          "format-alt": "{ipaddr}/{cidr} {icon}",
          "format-alt-click": "click-left",
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
          border:        none;
          border-radius: 0;
          font-family:  monospace;
          font-size:     12px;
          box-shadow:    none;
          text-shadow:   none;
          transition-duration: 0s;
          color:      #d5c4a1;
        }
        window#waybar {
          color:          #ebdbb2;
          background: transparent;
        }
        #workspaces button {
          padding:    0 4px;
          background: transparent;
        }
        #workspaces button.focused {
          background: rgba(100, 114, 125, 0.2);
        }
        #workspaces button:hover {
          box-shadow: none;
          text-shadow: none;
          border-color: transparent;
          background: transparent;
        }
        #clock {
          margin:     0px 16px 0px 10px;
          min-width:  10px;
          background: rgba(100, 114, 125, 0.2);
        }
        #battery {
          color:       #689d6a;
        }
        #battery.critical {
          color:          #fb4934;
        }
        #battery.good {
          color:          #689d6a;
        }
        #battery.charging {
          color:      #b8bb26;
        }
        #network.wifi {
          color:          #689d6a;
        }
        #network.disconnected {
          color:          #fe8019;
        }
        #pulseaudio, #memory, #cpu, #temperature.gpu, #battery, #network, #tray {
          margin:     0px 3px 0px 1px;
          min-width:  10px;
          background: rgba(100, 114, 125, 0.2);
        }
        #waybar > box:nth-child(2) > box:nth-child(3) > * > label {
          padding: 0 3px;
        }
    '';
  };
}
