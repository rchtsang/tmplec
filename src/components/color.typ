#let open-color = json("../assets/open-color.json")

/// open color hex lookup function
#let oc(name, step: none) = if step == none {
  rgb(open-color.at(name))
} else {
  rgb(open-color.at(name).at(step))
}
