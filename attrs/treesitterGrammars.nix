# p is a standin for a package of plugins -- it gets used in
# nvim-treesitter.withPlugins, which builds the treesitter plugin with only the
# requested grammars
{ p, ... }:
[
  p.fish
  p.haskell
  p.http
  p.java
  p.javascript
  p.json
  p.kotlin
  p.markdown
  p.markdown-inline
  p.nix
  p.org
  p.python
  p.scala
  p.sql
  p.tsx
  p.typescript
  p.vim
  p.yaml
]
