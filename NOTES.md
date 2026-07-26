# excalityp

goal here is to create a typst package to make it easier to prepare content for editing in [excalidraw](https://excalidraw.com) and [obsidian-excalidraw-plugin](https://github.com/zsviczian/obsidian-excalidraw-plugin).

i use the obsidian excalidraw plugin regularly for creating lecture notes.
excalidraw's hand-drawn aesthetic is by far the biggest reason for that, but the original has the annoying limitation of not supporting equation rendering.
the obsidian plugin has that, and a host of other cool features, which is why i opt for it over the upstream application.

excalidraw is fantastic for providing aesthetics, but in general it has major limitations with text (among other things).
when i prepare my notes, there tends to be a lot of text, and the excalidraw text boxes are just not feature-rich enough to apply the formatting i want.

what i am hoping for with this is a way to prepare my content in typst, and extract the rendered content blocks to excalidraw.

in an ideal world, excalidraw would support editable svg imports, but alas, it is not so.
moreover typst's svg output is as glyphs/symbols/paths, which is not actually what i want, since the eventual goal of the lecture notes is to export to an inline svg that i can paste into the course website notes.
hence, i am hoping it isn't too difficult to do the following:

- mark blocks for export somehow (tag blocks with an id in html export)
- compile to html
- extract html elements
- convert html elements to correctly positioned excalidraw json elements
- insert said elements into excalidraw somehow [json schema](https://docs.excalidraw.com/docs/codebase/json-schema)
  - via clipboard
  - as a new .excalidraw file

there would certainly be limitations, but i hope this would be better than nothing.

## update

now that i've created [typ2svg](https://github.com/rctsang/typ2svg) this is more feasible.
since typ2svg just converts the output pdf to a text-enabled svg using mutool, and embeds system fonts in the svg itself, i can just import the resulting svg.

doing this, of course has its issues: after the excalidraw export, the embedded svg will no longer have selectable text; but i can live with this, since i can make the template available separately.

i really only need a handful of things:
- a default page layout (slides)
- color utilities
- default text/header settings and notes
- tmthemes


