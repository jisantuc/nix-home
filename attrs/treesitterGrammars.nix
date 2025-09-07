# p is a standin for a package of plugins -- it gets used in
# nvim-treesitter.withPlugins, which builds the treesitter plugin with only the
# requested grammars
{ p, ... }:
[
  p.elixir
  p.fish
  p.haskell
  p.http
  p.java
  p.javascript
  p.json
  p.kotlin
  p.latex
  p.lua
  p.markdown
  p.markdown-inline
  p.nix
  p.norg
  p.python
  p.scala
  p.sql
  p.terraform
  p.tsx
  p.typescript
  p.vim
  p.vimdoc
  p.yaml
]
