{
  customCommands = [
    {
      key = "<c-v>";
      context = "global";
      description = "Create new conventional commit";
      prompts = [
        {
          type = "menu";
          key = "Type";
          title = "Type of change";
          options = [
            {
              name = "build";
              description = "Changes that affect the build system or external dependencies";
              value = "build";
              key = "b";
            }
            {
              name = "feat";
              description = "A new feature";
              value = "feat";
              key = "f";
            }
            {
              name = "fix";
              description = "A bug fix";
              value = "fix";
              key = "x";
            }
            {
              name = "chore";
              description = "Other changes that don't modify src or test files";
              value = "chore";
              key = "c";
            }
            {
              name = "ci";
              description = "Changes to CI configuration files and scripts";
              value = "ci";
              key = "i";
            }
            {
              name = "docs";
              description = "Documentation only changes";
              value = "docs";
              key = "d";
            }
            {
              name = "perf";
              description = "A code change that improves performance";
              value = "perf";
              key = "p";
            }
            {
              name = "refactor";
              description = "A code change that neither fixes a bug nor adds a feature";
              value = "refactor";
              key = "r";
            }
            {
              name = "revert";
              description = "Reverts a previous commit";
              value = "revert";
              key = "v";
            }
            {
              name = "style";
              description = "Changes that do not affect the meaning of the code";
              value = "style";
              key = "s";
            }
            {
              name = "test";
              description = "Adding missing tests or correcting existing tests";
              value = "test";
              key = "t";
            }
          ];
        }
        {
          type = "input";
          title = "Scope";
          key = "Scope";
          initialValue = "";
        }
        {
          type = "menu";
          key = "Breaking";
          title = "Breaking change";
          options = [
            {
              name = "no";
              value = "";
              key = "n";
            }
            {
              name = "yes";
              value = "!";
              key = "y";
            }
          ];
        }
        {
          type = "input";
          title = "message";
          key = "Message";
          initialValue = "";
        }
        {
          type = "input";
          title = "description";
          key = "Description";
          initialValue = "";
        }
        {
          type = "confirm";
          key = "Confirm";
          title = "Commit";
          body = "Are you sure you want to commit?";
        }
      ];
      command = ''
        git commit -m '{{.Form.Type}}{{ if .Form.Scope }}({{ .Form.Scope }}){{ end }}{{.Form.Breaking}}: {{.Form.Message}}' \
          -m {{.Form.Description | quote}}
      '';
      loadingText = "Creating conventional commit...";
    }
  ];
}
