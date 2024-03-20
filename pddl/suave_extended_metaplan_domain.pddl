(define (domain suave_extended)
    (:requirements :typing :fluents :durative-actions)

    (:types
      action
      function
      function_design
    )

    (:predicates
        (pipeline_found)
        (pipeline_inspected)
        (battery_charged)
        (battery_low)

        (a_search_pipeline_requires_f ?a - action ?f1 ?f2 - function)
        (a_inspect_pipeline_requires_f ?a - action ?f1 ?f2 - function)
        (a_recharge_requires_f ?a - action ?f1 ?f2 - function)

        (fd_solves_f ?fd - function_design ?f - function)
        (fd_available ?fd - function_design)
    )

    (:functions
      (system_performance)
      (fd_performance ?fd -function_design)
    )

    (:durative-action search_pipeline
        :parameters (?a - action ?f1 ?f2 - function ?fd1 ?fd2 - function_design)
        :duration ( = ?duration 5)
        :condition (and
          (over all (battery_charged))

          (over all (a_search_pipeline_requires_f ?a ?f1 ?f2))
          (over all (fd_solves_f ?fd1 ?f1))
          (over all (fd_solves_f ?fd2 ?f2))
          (over all (fd_available ?fd1))
          (over all (fd_available ?fd2))
        )
        :effect (and
            (at start (increase (system_performance) (+(fd_performance ?fd1) (fd_performance ?fd2))))
            (at end (pipeline_found))
        )
    )

    (:durative-action inspect_pipeline
        :parameters (?a - action ?f1 ?f2 - function ?fd1 ?fd2 - function_design)
        :duration ( = ?duration 5)
        :condition (and
          (over all (pipeline_found))
          (over all (battery_charged))

          (over all (a_inspect_pipeline_requires_f ?a ?f1 ?f2))
          (over all (fd_solves_f ?fd1 ?f1))
          (over all (fd_solves_f ?fd2 ?f2))
          (over all (fd_available ?fd1))
          (over all (fd_available ?fd2))
        )
        :effect (and
          (at start (increase (system_performance) (+(fd_performance ?fd1) (fd_performance ?fd2))))
          (at end(pipeline_inspected))
        )
    )

    (:durative-action recharge
        :parameters (?a - action ?f1 ?f2 - function ?fd1 ?fd2 - function_design)
        :duration ( = ?duration 5)
        :condition (and
          (over all (a_recharge_requires_f ?a ?f1 ?f2))
          (over all (fd_solves_f ?fd1 ?f1))
          (over all (fd_solves_f ?fd2 ?f2))
          (over all (fd_available ?fd1))
          (over all (fd_available ?fd2))
        )
        :effect (and
          (at start (increase (system_performance) (+(fd_performance ?fd1) (fd_performance ?fd2))))
          (at end (not(battery_low)))
          (at end (battery_charged))
        )
    )
)
