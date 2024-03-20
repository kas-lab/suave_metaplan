( define ( problem suave_metaplan )
( :domain suave )
( :objects
  a_search_pipeline a_inspect_pipeline a_recharge - action
  f_generate_search_path f_maintain_motion f_follow_pipeline f_recharge - function
  fd_search_low fd_search_medium fd_search_high fd_maintain_motion fd_recover_motion fd_recharge fd_follow - function_design
)

( :init
  (not(pipeline_found))
  (not(pipeline_inspected))
  (battery_low)

  (a_search_pipeline_requires_f a_search_pipeline f_generate_search_path f_maintain_motion)
  (a_inspect_pipeline_requires_f a_inspect_pipeline f_follow_pipeline f_maintain_motion)
  (a_recharge_requires_f a_recharge f_recharge f_maintain_motion)

  (fd_solves_f fd_search_low f_generate_search_path)
  (fd_solves_f fd_search_medium f_generate_search_path)
  (fd_solves_f fd_search_high f_generate_search_path)

  (fd_solves_f fd_maintain_motion f_maintain_motion)
  (fd_solves_f fd_recover_motion f_maintain_motion)

  (fd_solves_f fd_follow f_follow_pipeline)

  (fd_solves_f fd_recharge f_recharge)

  (fd_available fd_search_low)
  (fd_available fd_search_medium)
  (fd_available fd_search_high)

  (fd_available fd_maintain_motion)
  (fd_available fd_recover_motion)

  (fd_available fd_follow)
  (fd_available fd_recharge)

  (= (system_performance) 0.0)

  (= (fd_performance fd_search_low) 0.5)
  (= (fd_performance fd_search_medium) 0.7)
  (= (fd_performance fd_search_high) 1.0)

  (= (fd_performance fd_maintain_motion) 1.0)
  (= (fd_performance fd_recover_motion) 0.5)

  (= (fd_performance fd_follow) 1.0)
  (= (fd_performance fd_recharge) 1.0)
)

( :goal
  ( and
    (pipeline_found)
    (pipeline_inspected)
  )
)

(:metric maximize (system_performance) )
)
