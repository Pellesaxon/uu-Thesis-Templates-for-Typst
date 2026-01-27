= Some Tips for Typst Usage <sec:typst_tips>

To *refer* to sections, figures, tables, etc., use ```typ <sec:label> or #label("sec:label")``` to "set a mark" in the text or figure, and ```typ @sec:label or #ref(sec:label)``` to refer to it, for example, Read more on~#ref(<sec:formulas_figures_images_code>, form: "page") about naming sections, figures, etc. In Typst you can't label and refer to general text, but you can use headings for that, e.g.,
```typ
= Motivation <sec:motivation>
// #label("sec:motivation")
```
followed by
```typ 
As mentioned in~@sec:purpose...
```

See also~@app:appendix for how to handle appendices.

To prevent references from appearing immediately after a *line break*, use a non-breaking space `like~this`, where the tilde character `~` creates a non-breaking space. This is also generally correct to use before numbers (and in large numbers in English, e.g., `100~000` for 100,000), and of course also before `@fig`. 

To create a *paragraphbreak* it's best to use a blank line or ```typ #parbreak()```. #parbreak() To create a *page break* where the rest of the page becomes blank, use ```typ #pagebreak()```


= Hayagriva for Bibliography and References <sec:hayagriva_bibliography>

To manage bibliography (*references*) smoothly, use Hayagriva! Hayagriva is a new bibliography file format designed for use with Typst. Read more at #link("https://typst.app/docs/reference/model/bibliography/")[here] and use #link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[this] as a guide for file format. An example bibliography file is provided as `ref_examples.yml`. Typst also has suport for Bib(La)Tex files, but Hayagriva is more powerful and has a nicer syntax.

```yaml
harry:
    type: Book
    title: Harry Potter and the Order of the Phoenix
    author: Rowling, J. K.
    volume: 5
    page-total: 768
    date: 2003-06-21

electronic:
    type: Web
    title: Ishkur's Guide to Electronic Music
    serial-number: v2.5
    author: Ishkur
    url: 
        value: http://www.techno.org/electronic-music-guide/
        date: 2026-01-26
    
```
Multiple authors are presented as an array of strings.
```yaml 
author: ["Omarova, Saule", "Steele, Graham"]
```
And some fields accept composite data such as the `url` field above where the date specifies access date.


= References <app:referenser>

#align(
    center
)[#rect(
    width: 90%
)[#align(left)[
*NOTE: important!* There are at least three purposes for the design of references and the reference list.
+ One should find the reference (from the text) in the reference list.
+ One should understand what is being referred to (what type of reference it is) so that one can evaluate it.
+ One should be able to find the reference in reality.
Always strive to achieve all three.
]]]

Use numerical references (IEEE style~[42]) or keyword-based~[Lam86], not footnote style. The references are sorted alphabetically by author/etc. in the reference list. In Typst, use ```typ #bibliography{"refs.yml", style: "ieee"}```, see the main.tex. 

References are written in direct connection to what prompted the reference (e.g., a statement or result), before any punctuation, and with a non-breaking space to the previous word. In Typst, ```typ write~@Lam86``` to get a "non-breaking space." 

One should _not_ write the references after a longer paragraph (as some seem to be taught to do, somewhere). This usually makes it unclear what is actually taken from, or supported by, the references. In some cases, you may want to provide a short summary of what an author writes in an article, etc., but just adding a reference at the end of the paragraph is not clear enough. It is much better and clearer to start the paragraph by writing something like "Lisa Lagom describes```typ ~@lagom-bok``` how X depends on Y and in her analysis, she shows in detail how the relationship looks..."

Repeating the same reference often in a paragraph (maybe after every sentence) makes it more difficult to read. Try to rewrite the paragraph so that it becomes clear that it is all based on the reference, which should preferably be used early. Example: "In a study by WHO```typ ~@who```, the consequences of XYZ and the indirect risks that arise are described," and then the different consequences and risks can be discussed in the same paragraph without it becoming unclear.

When referencing "thick" items like books, it is appropriate to specify page numbers (as ```typ @example:alma[pp. 211-214]```) which becomes @example:alma[pp. 211-214], but for "thinner" items, you only need to do this to specifically point out if you mean a particular part of the reference (maybe it describes three different ways to do X and you want to point to the 3rd, not the first two).

To refer to multiple things simultaneously, write multiple reference keys after eachother ```typ @example:alma @example:dependability``` which becomes @example:alma @example:dependability.

Note that news articles (newspaper articles and the like) almost always have a publication date, which should be shown (e.g., in the ```yaml date``` field).

Even if a reference has a URL to the actual text, it is not necessarily a web reference, but sometimes an article/book, etc., that happens to be available online. It should then be described as an article/book/etc. (but of course preferably with the URL) so that one can make a preliminary assessment of the reference already when reading the reference list.

Try to find authors and publication dates (year, month) even for web references, and *always* specify when they were accessed, as they can be updated at any time. This is done by setting the composit values ```yaml {value: X, date: Y}``` on the ```yaml url``` field.  An example is~@example:uu (see `refs.yml`).


= Formulas, Figures, Images, Code <sec:formulas_figures_images_code>

Formulas, figures, and equations must be described. This means, for example, that each symbol must be explained in the text.

Figures and tables that are "floats" in LaTeX are more deterministic in Typst and generally end up within a page of where you place them. Still let figures and tables end up where Typst thinks they should, and adjust the placement only in the final version and if it is really necessary.

Figure captions should describe what we see in the figure, not just what type of figure it is. Writing "System structure" or "The structure of our system" for a picture of the system structure is not sufficient. Help the reader understand by also (or instead) describing the content, e.g., "The green circles represent users, and components with shaded background are external. Input comes from the left, and output is delivered to the right." It is therefore _not_ enough to describe the figure in the running text --- but of course, it should also be described there.

In English text, you write "Figure 3," not "figure 3," since it functions as a name for the figure (and similarly for Table, Section, Appendix, etc.).

All figures and images that are not your own must have references to the source. 

// The report template is set so that figures are presented with a line above, one below, and one between the caption and the image itself.

If you include code snippets, make sure they are relevant and commented, so they can be understood. Alternatively, for short snippets: provide the corresponding explanation in the text. In Typst you use `raw` elements for this purpose, see the code snippet in @sec:examples:code. In this project supported languages are formatted using codly. 


= Examples <sec:examples>

Some examples for different commands in Typst.

== References <sec:examples:references>

Uppsala University has 52~917 students @example:uu.

Bell et al. @example:alma[p. 312] describes...

@sec:background[Chapter] outlines ... and check out @sec:method as well as @app:appendix.

== Acronyms <sec:examples:acronyms>

#import "@preview/abbr:0.3.0"
// Add multiple entries, each of the form (short, long, long-plural).
*NOTE:* Example usage of Acronyms. Acronyms list can be seen in abbreviations section as it can't be displayed twice.

#abbr.make(
  ("PDE", "Partial Differential Equation"),
  ("BC", "Boundary Condition"),
  ("DOF", "Degree of Freedom", "Degrees of Freedom"),
  ("TGV", "High speed train"),
)
#abbr.add-alt("TGV","Train à haute vitesse", supplement: "from French")

// alternative:
// #abbr.load("abbreviations.csv")
// #abbr.load-alt("abbreviations_alt.csv", supplement: "from French")

*Constrained Equations*

@BC:pla constrain the @DOF:pla of the @PDE:pla they act on.

// Example of configuring abbreviations
#abbr.config(style: it => text(red, it), space-char: sym.arrow.l.r)

@BC:pla constrain the @DOF:pla of the @PDE:pla they act on.

#abbr.add("MOL", "Method of Lines")
The @MOL is a procedure to solve @PDE:pla in time.

*A note about trains showcasing alt*

The @TGV has a commercial speed of up to 320 km/h.

== Figures <sec:examples:figures>

Look at this fabulous building and statue in @img:university_hall.

#figure(
    image("/dependencies/university_hall.jpg", width: auto),
    caption: "University Hall or the University Main Building is the main building of Uppsala University in Uppsala, Sweden. The statue in front of the building is Erik Gustaf Geijer (1783-1847), a Swedish writer, historian, poet, philosopher, and composer. Photo: ScanianDragon (2023).",
) <img:university_hall>

== Tables <sec:examples:tables>

Tables can also be placed in figures as seen in @tab:numbers.

#show table.cell.where(x: 0): emph
#show table.cell.where(y: 0): strong
#figure(
    table(
        columns: 3,
        table.header[][Students][Employees],
        [Quantity], [52 917], [7 622],
    ),
    caption: "Number of students and employees at Uppsala University.",
) <tab:numbers>

== Code <sec:examples:code>

Finally you can insert code in a figure as in @listing:sum.

#figure(
    ```python
    # Sum
    def sum(x, y):
        return x + y

    print("Sum:", sum(1,1))

    ```,
    caption: "Python implementation of adding two numbers.",
) <listing:sum>

== Math <sec:examples:math>
You can decide if you want math in text such as $a^2+b^2=c^2$ or as a block like in @eq:area_half_circle. $ A = (pi r^2) / 2 = 1/2 pi r^2 $<eq:area_half_circle> Placing spaces after the opening dollar sign and whitespace before the closing dollar sign is the shorthand for blocking. You can also add alt text alt text using the
```typ #math.equation(alt: "alt text", content)``` syntax. If you want the equation syntax to block use the block option ```typ #math.equation(block: true)``` as in @eq:integral

#math.equation(
  alt: "integral from 1 to infinity of a x squared plus b with respect to x",
  block: true,
  $ integral_1^oo a x^2 + b dif x $,
) <eq:integral>

*Example of both in text match and blocks* \
Let $a$, $b$, and $c$ be the side
lengths of right-angled triangle.
Then, we know that:
$ a^2 + b^2 = c^2 $

Prove by induction:
$ sum_(k=1)^n k = (n(n+1)) / 2 $