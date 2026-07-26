#import "@preview/scaffolder:0.2.1": scaffolding

#import "@local/tmplec:0.0.1" as tmplec

#let page-settings = tmplec.page-settings(
  background: scaffolding(
    stroke: (paint: red, thickness: 1pt, cap: "round", dash: "dashed")
  ),
)

#show: tmplec.template.with(page-settings: page-settings)

#tmplec.title[tmplec] #h(1fr) #tmplec.subtitle[lecture templates]

#lorem(20)

#tmplec.h1[Header 1]

#tmplec.h2[Header 2]

```python
def test(param="hello"):
    print(param)
```
