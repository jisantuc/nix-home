{

  format = "$directory$character";
  right_format = "$all";

  # don't show the weird up-down arrow for shlvl
  # (no idea what that is still)
  shlvl.disabled = true;

  # don't show package version
  package.disabled = true;

  # make directories look like they do in fish
  directory.fish_style_pwd_dir_length = 1;
  directory.truncation_length = 2;

  # version-less runtimes in the prompt
  bun.format = "[$symbol]($style)";
  buf.format = "[$symbol]($style)";
  cmake.format = "[$symbol]($style)";
  cobol.format = "[$symbol]($style)";
  crystal.format = "[$symbol]($style)";
  daml.format = "[$symbol]($style)";
  dart.format = "[$symbol]($style)";
  deno.format = "[$symbol]($style)";
  dotnet.format = "[$symbol(🎯 $tfm )]($style)";
  elixir.format = "[$symbol]($style)";
  elm.format = "[$symbol]($style)";
  erlang.format = "[$symbol]($style)";
  golang.format = "[$symbol]($style)";
  haskell.format = "[$symbol]($style)";
  helm.format = "[$symbol]($style)";
  java.format = "[$symbol]($style)";
  julia.format = "[$symbol]($style)";
  kotlin.format = "[$symbol]($style)";
  lua.format = "[$symbol]($style)";
  meson.format = "[$symbol]($style)";
  nim.format = "[$symbol]($style)";
  nix_shell.format = "[$symbol]($style)";
  nodejs.format = "[$symbol]($style)";
  ocaml.format = "[$symbol(\($switch_indicator$switch_name\) )]($style)";
  perl.format = "[$symbol]($style)";
  php.format = "[$symbol]($style)";
  pulumi.format = "[$symbol$stack]($style)";
  purescript.format = "[$symbol]($style)";
  python.format = "[$symbol]($style)";
  raku.format = "[$symbol]($style)";
  red.format = "[$symbol]($style)";
  rlang.format = "[$symbol]($style)";
  ruby.format = "[$symbol]($style)";
  rust.format = "[$symbol]($style)";
  scala.format = "[$symbol]($style)";
  scala.symbol = "🐚 ";
  swift.format = "[$symbol]($style)";
  vagrant.format = "[$symbol]($style)";
  vlang.format = "[$symbol]($style)";
  zig.format = "[$symbol]($style)";
}
