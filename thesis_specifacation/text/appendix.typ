Appendices can be useful for attachments such as surveys, larger code segments, etc.

Appendices should be placed after the reference list and should start on a new page. Use `#pagebreak()` to create a page break where the rest of the current page is blank. Then use 
```typ #set heading(numbering: "A.1.1.1   ")```
to change heading to indicate that we are in the appendix and ```typ#context counter(heading).update(0)``` to reset the heading counter. Then use the usual ```typ == Label <app:label>``` for each appendix, which will be "numbered" A.1, A.2, A.3, etc. In this project using ```typ <app:...>``` in the label will replace the supplement with "Appendix" when refferenced.

To refer to an appendix, do the same as for a section.