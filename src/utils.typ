#import "@preview/oxifmt:1.0.0": strfmt

#let pkgmeta = toml("../typst.toml")

#let PREFIX = strfmt(
  "@local/{}:{}",
  pkgmeta.package.name,
  pkgmeta.package.version,
)
