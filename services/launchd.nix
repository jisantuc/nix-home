{ config, ... }:
{
  launchd.agents = {
    compress-vimwiki = {
      enable = true;
      config = {
        ProgramArguments = [
          "zip"
          "-r9"
          "${config.home.homeDirectory}/vimwiki.zip"
          "${config.home.homeDirectory}/vimwiki"
        ];
        # Twice a week
        StartInterval = 302400;
        StandardErrorPath = "${config.home.homeDirectory}/Library/Logs/vimwiki-backup.err.log";
        StandardOutPath = "${config.home.homeDirectory}/Library/Logs/vimwiki-backup.out.log";
      };
    };
  };
}
