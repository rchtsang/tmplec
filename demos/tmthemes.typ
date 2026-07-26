#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *

#import "@local/tmplec:0.0.1" as tmplec

#show: codly-init.with()
#codly(
  languages: codly-languages,
  zebra-fill: none
)

/// https://www.programiz.com/c-programming/examples/structure-dynamic-memory-allocation
#let c-sample = ```c
#include <stdio.h>
#include <stdlib.h>
struct course {
  int marks;
  char subject[30];
};

int main() {
  struct course *ptr;
  int noOfRecords;
  printf("Enter the number of records: ");
  scanf("%d", &noOfRecords);

  // Memory allocation for noOfRecords structures
  ptr = (struct course *)malloc(noOfRecords * sizeof(struct course));
  for (int i = 0; i < noOfRecords; ++i) {
    printf("Enter subject and marks:\n");
    scanf("%s %d", (ptr + i)->subject, &(ptr + i)->marks);
  }

  printf("Displaying Information:\n");
  for (int i = 0; i < noOfRecords; ++i) {
    printf("%s\t%d\n", (ptr + i)->subject, (ptr + i)->marks);
  }

  free(ptr);

  return 0;
}
```

#for theme in tmplec.tm-themes.keys() [
  #set raw(theme: tmplec.tm-themes.at(theme))
  #text(size: 20pt, theme)

  #c-sample
  #pagebreak()
]
