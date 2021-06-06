Rails.application.routes.draw do



  # Routes for the Sgcomment resource:

  # CREATE
  post("/insert_sgcomment", { :controller => "sgcomments", :action => "create" })
          
  # READ
  get("/sgcomments", { :controller => "sgcomments", :action => "index" })
  
  get("/sgcomments/:path_id", { :controller => "sgcomments", :action => "show" })
  
  # UPDATE
  
  post("/modify_sgcomment/:path_id", { :controller => "sgcomments", :action => "update" })
  
  # DELETE
  get("/delete_sgcomment/:path_id", { :controller => "sgcomments", :action => "destroy" })

  #------------------------------

  # Routes for the Member resource:

  # CREATE
  post("/insert_member", { :controller => "members", :action => "create" })
          
  # READ
  get("/members", { :controller => "members", :action => "index" })
  
  get("/members/:path_id", { :controller => "members", :action => "show" })
  
  # UPDATE
  
  post("/modify_member/:path_id", { :controller => "members", :action => "update" })
  
  # DELETE
  get("/delete_member/:path_id", { :controller => "members", :action => "destroy" })

  #------------------------------

  # Routes for the Studygroup resource:

  # CREATE
  post("/insert_studygroup", { :controller => "studygroups", :action => "create" })
          
  # READ
  get("/studygroups", { :controller => "studygroups", :action => "index" })
  
  get("/studygroups/:path_id", { :controller => "studygroups", :action => "show" })
  
  # UPDATE
  
  post("/modify_studygroup/:path_id", { :controller => "studygroups", :action => "update" })
  
  # DELETE
  get("/delete_studygroup/:path_id", { :controller => "studygroups", :action => "destroy" })

  #------------------------------

  # Routes for the Employer resource:

  # CREATE
  post("/insert_employer", { :controller => "employers", :action => "create" })
          
  # READ
  get("/employers", { :controller => "employers", :action => "index" })
  
  get("/employers/:path_id", { :controller => "employers", :action => "show" })
  
  # UPDATE
  
  post("/modify_employer/:path_id", { :controller => "employers", :action => "update" })
  
  # DELETE
  get("/delete_employer/:path_id", { :controller => "employers", :action => "destroy" })

  #------------------------------

  # Routes for the Enrollment resource:

  # CREATE
  post("/insert_enrollment", { :controller => "enrollments", :action => "create" })
          
  # READ
  get("/enrollments", { :controller => "enrollments", :action => "index" })
  
  get("/enrollments/:path_id", { :controller => "enrollments", :action => "show" })
  
  # UPDATE
  
  post("/modify_enrollment/:path_id", { :controller => "enrollments", :action => "update" })
  
  # DELETE
  get("/delete_enrollment/:path_id", { :controller => "enrollments", :action => "destroy" })

  #------------------------------

  # Routes for the School resource:

  # CREATE
  post("/insert_school", { :controller => "schools", :action => "create" })
          
  # READ
  get("/schools", { :controller => "schools", :action => "index" })
  
  get("/schools/:path_id", { :controller => "schools", :action => "show" })
  
  # UPDATE
  
  post("/modify_school/:path_id", { :controller => "schools", :action => "update" })
  
  # DELETE
  get("/delete_school/:path_id", { :controller => "schools", :action => "destroy" })

  #------------------------------

  # Routes for the Curriculum resource:

  # CREATE
  post("/insert_curriculum", { :controller => "curriculums", :action => "create" })
          
  # READ
  get("/curriculums", { :controller => "curriculums", :action => "index" })
  
  get("/curriculums/:path_id", { :controller => "curriculums", :action => "show" })
  
  # UPDATE
  
  post("/modify_curriculum/:path_id", { :controller => "curriculums", :action => "update" })
  
  # DELETE
  get("/delete_curriculum/:path_id", { :controller => "curriculums", :action => "destroy" })

  #------------------------------

  # Routes for the Courseload resource:

  # CREATE
  post("/insert_courseload", { :controller => "courseloads", :action => "create" })
          
  # READ
  get("/courseloads", { :controller => "courseloads", :action => "index" })
  
  get("/courseloads/:path_id", { :controller => "courseloads", :action => "show" })
  
  # UPDATE
  
  post("/modify_courseload/:path_id", { :controller => "courseloads", :action => "update" })
  
  # DELETE
  get("/delete_courseload/:path_id", { :controller => "courseloads", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Professor resource:

  # CREATE
  post("/insert_professor", { :controller => "professors", :action => "create" })
          
  # READ
  get("/professors", { :controller => "professors", :action => "index" })
  
  get("/professors/:path_id", { :controller => "professors", :action => "show" })
  
  # UPDATE
  
  post("/modify_professor/:path_id", { :controller => "professors", :action => "update" })
  
  # DELETE
  get("/delete_professor/:path_id", { :controller => "professors", :action => "destroy" })

  #------------------------------

  # Routes for the Course resource:

  # CREATE
  post("/insert_course", { :controller => "courses", :action => "create" })
          
  # READ
  get("/", { :controller => "courses", :action => "index" })
  get("/courses", { :controller => "courses", :action => "index" })
  
  get("/courses/:path_id", { :controller => "courses", :action => "show" })
  
  # UPDATE
  
  post("/modify_course/:path_id", { :controller => "courses", :action => "update" })
  
  # DELETE
  get("/delete_course/:path_id", { :controller => "courses", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM     
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------
  get("/users", { :controller => "user_authentication", :action => "index"})

  get("/users/:path_id", { :controller => "user_authentication", :action => "show" })

end
