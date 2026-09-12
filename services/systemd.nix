{pkgs, ...}:
{
  systemd.user.services.sync-vimwiki = {
    Unit = {
      Description = "Push vimwiki to personal vimwiki private repo";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      ExecStart = "${pkgs.writeShellScript "sync-vimwiki" ''
        #!/usr/bin/env bash

        set -e

        pushd $HOME/vimwiki
        git stash
        git checkout main
        echo "Changes stashed, on main"
        git pull --rebase origin main
        git push origin main
        echo "main updated"
        git checkout --
        git stash pop || true
        echo "Vimwiki update complete"
      ''}";
    };
  };

  systemd.user.startServices = "sd-switch";

  systemd.user.timers.sync-vimwiki = {
    Unit = {
      Description = "Timer for auto-sync vimwiki";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
    Timer = {
      OnBootSec = "1m";
      OnUnitActiveSec = "3h";
    };
  };
}
