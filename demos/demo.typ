#import "@preview/scaffolder:0.2.1": scaffolding

#import "@local/tmplec:0.0.1" as tmplec

#let page-settings = tmplec.page-settings(
  background: scaffolding(
    stroke: (paint: red, thickness: 1pt, cap: "round", dash: "dashed")
  ),
)

#show: tmplec.template.with(
  course: "Test Course",
  lec-num: 0,
  topic: "Demo Notes",
  author: ("John Doe",),
  date: datetime(year: 2000, month: 1, day: 1),
  page-settings: page-settings,
)

= Header

#lorem(20)

== Subheader

```python
def test(param="hello"):
    print(param)
```
