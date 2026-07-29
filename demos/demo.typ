#import "@local/scaffolder:0.2.2": scaffolding, get-page-margins

#import "@local/tmplec:0.0.1" as tmplec

// #let margins = context get-page-margins()

#let page-settings = tmplec.page-settings(
  background: scaffolding(
    stroke: (paint: red, thickness: 1pt, cap: "round", dash: "dashed"),
  ),
  // background: context [
  //   Page Margins: #get-page-margins()
  // ],
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

// Page Margins: #margins
