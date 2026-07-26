#import "color.typ": oc

// font sizes (from excalidraw)
#let xl = 27pt
#let lg = 21pt
#let md = 15pt
#let sm = 12pt

#let title(..params, body) = text(size: xl, ..params, body)

#let subtitle(..params, color: oc("gray", step: 6), body) = text(
  size: lg,
  fill: color,
  ..params,
  body,
)

#let h1(..params, color: oc("violet", step: 8), body) = text(
  size: xl,
  fill: color,
  ..params,
  body,
)

#let h2(..params, color: oc("violet", step: 8), body) = text(
  size: lg,
  fill: color,
  ..params,
  body,
)

