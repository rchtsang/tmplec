#import "@preview/elembic:1.1.1" as e
#import "color.typ": oc
#import "../utils.typ": PREFIX

#let choices(..choices, columns: 1) = {
  let choices = choices.pos()
  let args = arguments(
      columns: if columns == 0 {
        (1fr,) * choices.len()
      } else {
        (1fr,) * columns
      },
      row-gutter: if columns == 1 { 1em } else { 2em },
      column-gutter: 2em,
    )
    let numbered-choices = ()
    for (i, choice) in choices.enumerate() {
      numbered-choices.push(grid(
        columns: 2, gutter: 1em,
        align: horizon,
        [#std.numbering("A)", i+1)], [#choice],
      ))
    }
    grid(..args, ..numbered-choices)
  }
)

#let poll = e.element.declare(
  "poll",
  prefix: PREFIX,
  fields: (
    e.field("body", content, required: true,
      doc: "the poll question"),
    e.field("above", e.types.union(length, relative), default: 2in,
      doc: "spacing above poll question"),
    e.field("below", e.types.union(length, relative), default: 4in,
      doc: "spacing below poll question"),
  ),
  display: it => block(above: it.above, below: it.below)[
    #text(fill: oc("orange", step: 6))[Poll -] #it.body
  ],
)
