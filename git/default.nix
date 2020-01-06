{ config, options, lib, pkgs, ... }:
with lib;
let cfg = config.programs.git;
in {
  options = {
    programs.git = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };

      lfsEnable = mkOption {
        type = types.bool;
        default = true;
      };

      user = mkOption {
        type = types.lines;
        default = "";
      };

      core = mkOption {
        type = types.lines;
        default = "";
      };

      status = mkOption {
        type = types.lines;
        default = "";
      };

      rerere = mkOption {
        type = types.lines;
        default = "";
      };

      color = mkOption {
        type = types.lines;
        default = "";
      };

      colorBranch = mkOption {
        type = types.lines;
        default = "";
      };

      colorDiff = mkOption {
        type = types.lines;
        default = "";
      };

      colorStatus = mkOption {
        type = types.lines;
        default = "";
      };

      diff = mkOption {
        type = types.lines;
        default = "";
      };

      diffTool = mkOption {
        type = types.lines;
        default = "";
      };

      merge = mkOption {
        type = types.lines;
        default = "";
      };

      mergeTool = mkOption {
        type = types.lines;
        default = "";
      };

      alias = mkOption {
        type = types.lines;
        default = "";
      };

      extraConfig = mkOption {
        type = types.lines;
        default = "";
      };

      extraPackages = mkOption {
        type = types.listOf types.package;
        default = [ ];
      };
    };
  };

  config = mkIf cfg.enable (mkMerge [
    {
      environment = {
        systemPackages = with pkgs; [ git ] ++ cfg.extraPackages;
        etc."gitconfig".text = ''
          [user]
            ${cfg.user}
          [core]
            ${cfg.core}
          [status]
            ${cfg.status}
          [rerere]
            ${cfg.rerere}
          [color]
            ${cfg.color}
          [color "branch"]
            ${cfg.colorBranch}
          [color "diff"]
            ${cfg.colorBranch}
          [color "status"]
            ${cfg.colorStatus}
          [diff]
            ${cfg.diff}
          [difftool]
            ${cfg.diffTool}
          [merge]
            ${cfg.merge}
          [mergetool]
            ${cfg.mergeTool}
          [alias]
            ${cfg.alias}
          ${cfg.extraConfig}
        '';
      };
    }

    (mkIf cfg.lfsEnable {
      environment.systemPackages = [ pkgs.git-lfs ];
      environment.etc."gitconfig".text = mkAfter ''
        [filter "lfs"]
          clean = git-lfs clean -- %f
          smudge = git-lfs smudge -- %f
          process = git-lfs filter-process
          required = true
      '';
    })
  ]);
}
