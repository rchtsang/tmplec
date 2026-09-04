#import "@preview/oxifmt:1.0.0": strfmt

#let pkgmeta = toml("../typst.toml")

#let PREFIX = strfmt(
  "@local/{}:{}",
  pkgmeta.package.name,
  pkgmeta.package.version,
)

#let EXCALIDRAW_DPI = 96

#let px2len(pixels, dpi: EXCALIDRAW_DPI) = {
  (pixels / dpi) * 1in;
}

#let EXCALIDRAW_GRID_MINOR_STEP = px2len(20)
#let EXCALIDRAW_GRID_MAJOR_STEP = EXCALIDRAW_GRID_MINOR_STEP * 5

// #let top-margin() = {
//   if type(page.margin) == dictionary {
//     page.margin.top
//   } else {
//     page.margin
//   }
// }
//
// #let snap(len, step: "major") = {
//   let step = if step == "minor" {
//     EXCALIDRAW_GRID_MINOR_STEP
//   } else {
//     EXCALIDRAW_GRID_MAJOR_STEP
//   }
//   let abs-y = here().position().y
//   let rel-y = abs-y - top-margin().length
//
//   let target = (rel-y + len).to-absolute()
//
//   let remainder = calc.rem-euclid(target.mm(), step.mm())
//
//   if remainder == 0 {
//     len
//   } else {
//     len + (step - (remainder * 1mm))
//   }
// }
//
// #let v-snap(len) = context v(snap(len))
