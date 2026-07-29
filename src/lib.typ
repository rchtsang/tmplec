#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/elembic:1.1.1" as e

#import "components/color.typ": oc
#import "components/themes.typ": tm-themes
#import "components/text.typ" as tl-text: *
#import "components/settings.typ": (
  page-settings,
  text-settings,
  codly-settings,
  raw-settings,
)

#let PREFIX = "@local/tmplec:0.0.1"


#let template = e.element.declare(
  "template",
  prefix: PREFIX,
  doc: "lecture template element",
  fields: (
    e.field("body", content, required: true,
      doc: "document body content"),
    e.field("lec-num", e.types.option(int), named: true, default: none,
      doc: "lecture number"),
    e.field("topic", e.types.option(str), named: true, default: none,
      doc: "lecture topic(s)"),
    e.field("course", str, named: true, required: true,
      doc: "course title"),
    e.field("author", e.types.array(str), named: true, default: (),
      doc: "author list"),
    e.field("date", e.types.option(datetime), named: true, default: none,
      doc: "lecture date"),
    e.field("page-settings", page-settings,
      default: page-settings(),
      doc: "template page settings"),
    e.field("codly-settings", codly-settings,
      default: codly-settings(zebra-fill: none, lang-format: none),
      doc: "template codly settings"),
    e.field("text-settings", text-settings,
      default: text-settings(),
      doc: "template text settings"),
    e.field("raw-settings", raw-settings,
      default: raw-settings(theme: tm-themes.ayu-light),
      doc: "template raw block settings"),
    e.field("raw-text-settings", text-settings,
      default: text-settings(font: "Comic Shanns"),
      doc: "template raw text settings"),
  ),
  display: it => {
    assert(it.lec-num != it.topic,
      message: "must provide at least one of 'lec-num' or 'topic'")
    let title = [
      #tl-text.title[
        #if it.lec-num != none [ Lecture #it.lec-num ]
        #if it.topic != none [ \- #it.topic ]
      ] \
      #tl-text.subtitle[#it.course] \
      #if it.date != none { tl-text.subtitle[ #it.date.display() ] } \
      #if it.author.len() > 0 {
        tl-text.subtitle[ #it.author.join(", ", last: ", and ") ]
      }
    ]
    let description = [
      #it.course : Lecture #it.lec-num #if it.topic != none [ \- #it.topic ]
    ]

    set document(
      title: title,
      author: it.author,
      description: description,
      date: it.date,
    )

    set page(..e.fields(it.page-settings))
    set text(..e.fields(it.text-settings))

    set raw(..e.fields(it.raw-settings))
    show raw: set text(..e.fields(it.raw-text-settings))

    show: codly-init.with()
    codly(..e.fields(it.codly-settings))

    show link: set text(fill: oc("blue", step: 8))
    show heading: set block(below: 2em)
    show heading.where(level: 1): set text(fill: oc("violet", step: 8), size: xl)
    show heading.where(level: 2): set text(fill: oc("violet", step: 8), size: lg)
    show heading.where(level: 3): set text(fill: oc("violet", step: 6), size: lg)
    show figure.caption: set text(fill: oc("gray", step: 7), size: sm)


    std.title()
    v(5in)
    it.body
  },
)


/// emit useful metadata here

#metadata(tm-themes) <tm-themes>
