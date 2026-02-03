#import "@preview/timeliney:0.4.0"
#let months = (
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
)

#timeliney.timeline(
  show-grid: true,
  {
    import timeliney: *

    headerline(group(([*2026*], 6)))
    headerline(
      group(..range(6).map(n => strong(months.at(n)))),
    )


    milestone(
      at: 0.6,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *Project start*\
        Jan 19
      ]),
    )
    taskgroup(title: [*Preparation & Research*], {
      task("Literature review", (from: 0.6, to: 1.5), style: (stroke: 2pt + gray))
      task("Study current system", (from: 0.6, to: 1.5), style: (stroke: 2pt + gray))
      task("Env setup", (from: 0.8, to: 2), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*Baseline & Evaluation*], {
      task("Test specification", (from: 1, to: 2), style: (stroke: 2pt + gray))
      task("Benchmark & profile", (from: 1, to: 2), style: (stroke: 2pt + gray))
    })

    milestone(
      at: 2,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *Baseline established*\
        Feb 28
      ]),
    )

    taskgroup(title: [*Perform Optimization*], {
      task("Design techniques", (from: 1.7, to: 3.5), style: (stroke: 2pt + gray))
      task("Implement techniques", (from: 2.5, to: 4), style: (stroke: 2pt + gray))
      task("Benchmark techniques", (from: 3, to: 4), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*Retraining classifiers*], {
      task("Retrain one SVM & compare", (from: 2.8, to: 3.2), style: (stroke: 2pt + gray))
      task("Retrain all SVMs (if neccecery)", (from: 3, to: 4.5), style: (stroke: 2pt + gray))
    })

    milestone(
      at: 3.2,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *Retrain decision*\
        Apr 7
      ]),
    )

    milestone(
      at: 4,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *\ Optimization approach \ selected*\
        Apr 30
      ]),
    )

    taskgroup(title: [*Additional Optimizations*], {
      task("Dynamic programming", (from: 4, to: 5), style: (stroke: 2pt + gray))
      task("Parallelism experiments", (from: 4, to: 5), style: (stroke: 2pt + gray))
      task("Memory efficiency", (from: 4, to: 5), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*Writing and documentation*], {
      task("Thesis writing", (from: 1, to: 5.2), style: (stroke: 2pt + gray))
      task("Documentation and artifacts", (from: 4, to: 5.2), style: (stroke: 2pt + gray))
    })

    milestone(
      at: 5.2,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *Final thesis\ demonstration *\
        Jun 5
      ]),
    )
  },
)
