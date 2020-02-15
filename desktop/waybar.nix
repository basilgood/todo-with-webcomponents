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
          "height": 28,
         // "width": 1000,

         "modules-left": ["sway/workspaces", "sway/window"],
         "modules-center": ["clock"],
         "modules-right": [
           "network",
           "cpu",
           "temperature#cpu",
           "memory",
           "temperature#gpu",
           "pulseaudio",
           "battery",
           "tray"
         ],
          "sway/workspaces": {
            "all-outputs": false,
            "format": "{name}"
          },
         "sway/window": {
           "format": "  {}  ",
                 "text-align": "center",
                 "line-height": 0
             },
         "sway/mode": {
             "format": "<span style=\"bold\">{}</span>"
         },
         "network": {
           "format": "{icon}",
           "format-wifi": "({signalStrength}%) {icon}",
           "format-ethernet": "{icon}",
           "format-icons": {
             "wifi": [""],
             "ethernet": [""],
             "disconnected": ["⚠"]
           },
           "tooltip": false
         },
         "tray": {
             // "icon-size": 21,
             "spacing": 10
         },
         "clock": {
             "tooltip-format": "{:%Y-%m-%d | %H:%M}",
             "format-alt": "{:%Y-%m-%d}"
         },
         "cpu": {
             "format": "{usage}%",
             "tooltip": false
         },
         "temperature#cpu": {
           "thermal-zone": 1,
           "hwmon-path": "/sys/class/hwmon/hwmon0/temp1_input",
           "critical-threshold": 80,
           "format-critical": "{temperatureC}°C",
           "format": "{temperatureC}°C"
         },
         "memory": {
             "format": "{}%"
         },
         "temperature#gpu": {
           "thermal-zone": 2,
           "hwmon-path": "/sys/class/hwmon/hwmon1/temp1_input",
           "critical-threshold": 80,
           "format-critical": "{temperatureC}°C",
           "format": "{temperatureC}°C"
         },
         "battery": {
           "bat": "BAT1",
           "interval": 60,
           "states": {
             "warning": 40,
             "critical": 20
           },
           "format": "{capacity}% {icon}",
           "format-icons": ["", "", "", "", ""],
           "max-length": 25
         },
         "pulseaudio": {
           "format": "{volume}% {icon}",
           "format-muted": "[MUTE]",
           "format-icons": {
               "headphones": "♫",
               "handsfree": "♫",
               "headset": "♫",
               "phone": "♫",
               "portable": "♫",
               "car": "V",
               "default": ["♫", "♫", "♫"]
           },
           "scroll-step": 5,
           "on-click-right": "pactl set-sink-mute 0 toggle",
           "tooltip": false
        }
      }
    '';
    environment.etc."xdg/waybar/style.css".text = with pkgs; ''
      * {
        border-top: 0;
        border-radius: 0;
        font-family: monospace;
        font-size: 14px;
        color: #f0f0f0;
        min-height: 0;
      }
      window#waybar {
        background: transparent;
      }

      window box > box{
        margin: 6px 45px 0px 45px;
        background-color: rgba(0, 0, 0, 0.82);
        border: 1px solid rgba(106, 159, 203, 0.666);
        transition-property: background-color;
        transition-duration: .5s;
        border-radius: 6px;
        padding: 1px 8px 1px 8px ;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #c5c8c6;
        border: 1px solid transparent;
        border-radius:3px;
      }

      #workspaces button:hover {
        background: rgba( 26, 69, 105, 0.4);
        box-shadow: inherit;
        border: 1px solid #ffffff;
      }

      #workspaces button.focused {
        background-color: #0d0f11;
        border: 1px solid #6a9fcb;
      }

      #workspaces button.urgent {
        background-color: #eb4d4b;
      }

      #mode, #pulseaudio, #cpu, #temperature.cpu, #temperature.gpu, #memory, #network, #tray,

      #clock {
             padding: 1px 5px 0px 5px;
      }

      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }

      label:focus {
        background-color: #000000;
      }

      #cpu, #temperature.cpu {
        margin-left: 0px;
        margin-right:0px;
        background-color: rgba(167,90,123,.6);
        padding: 1px 12px 0px 12px;
      }

      #memory, #temperature.gpu {
        margin-left: 0px;
        margin-right: 0px;
        background-color: rgba(150,157,79,.6);
        padding: 1px 9px 0px 9px;
      }

      #pulseaudio {
        margin: 0px 6px 0px 4px;
        background-color: rgba(122,76,43,.7);
        padding: 1px 6px 0px 5px;
      }

      #pulseaudio.muted {
        background-color: rgb(62,38,107);
        color: #2a5c45;
      }

      #battery {
        color: #e5c07b;
      }
      #battery.charging {
        color: #26A65B;
      }
      #battery.warning,
      #batter.critical
      {
        color: #f53c3c;
      }
      #battery.critical:not(.charging) {
        color: #f53c3c;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #tray {
        background-color: #2980b9;
      }
    '';
  };
}
