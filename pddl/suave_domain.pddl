(define (domain suave)
    (:requirements :typing :fluents :durative-actions :negative-preconditions)

    (:types
    )

    (:predicates
        (pipeline_found)
        (pipeline_inspected)
    )

    (:functions
    )

    (:durative-action search_pipeline
        :parameters ()
        :duration ( = ?duration 5)
        :condition (and )
        :effect (and
            (at end(pipeline_found))
        )
    )

    (:durative-action inspect_pipeline
        :parameters ()
        :duration ( = ?duration 5)
        :condition (and
            (over all (pipeline_found))
        )
        :effect (and
            (at end(pipeline_inspected))
        )
    )
)
