( define ( problem suave_metaplan )
( :domain suave )
( :objects
)
( :init
  (not(pipeline_found))
  (not(pipeline_inspected))
)
( :goal
  ( and
    (pipeline_found)
    (pipeline_inspected)
  )
)
)
