(define (domain suave_extended)
    (:requirements :typing :fluents :durative-actions)

    (:types
    )

    (:predicates
        (pipeline_found)
        (pipeline_inspected)
        (battery_charged)
        (battery_low)
    )

    (:functions
    )

    (:durative-action search_pipeline
        :parameters ()
        :duration ( = ?duration 5)
        :condition (and
          (over all (battery_charged))
        )
        :effect (and
            (at end(pipeline_found))
        )
    )

    (:durative-action inspect_pipeline
        :parameters ()
        :duration ( = ?duration 5)
        :condition (and
          (over all (pipeline_found))
          (over all (battery_charged))
        )
        :effect (and
          (at end(pipeline_inspected))
        )
    )

    (:durative-action recharge
        :parameters ()
        :duration ( = ?duration 5)
        :condition (and
          (at start (battery_low))
        )
        :effect (and
          (at end (not(battery_low)))
          (at end (battery_charged))
        )
    )
)
