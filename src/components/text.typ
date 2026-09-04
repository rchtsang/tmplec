#import "../utils.typ": px2len
#import "color.typ": oc

// font sizes (from excalidraw)
#let xl = px2len(36)
#let lg = px2len(28)
#let md = px2len(20)
#let sm = px2len(16)

#let title(..params, body) = text(size: xl, ..params, body)

#let subtitle(..params, color: oc("gray", step: 6), body) = text(
  size: lg,
  fill: color,
  ..params,
  body,
)

#let slidebreak(space: 5in) = v(space)
