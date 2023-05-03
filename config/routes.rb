Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "index"})

  get("/users", {:controller => "users", :action => "index"})

  get("/users/:username", {:controller => "users", :action => "detail"})

  get("/insert_user_record", {:controller => "users", :action => "create_user"})

  get("/update_user/:user_id", {:controller => "users", :action => "update_user"})


  get("/photos", {:controller => "photos", :action => "index"})

  get("/photos/:photo_id", {:controller => "photos", :action => "detail"})

  get("/delete_photo/:photo_id", {:controller => "photos", :action => "delete"})

  get("/insert_photo", {:controller => "photos", :action => "create_record"})

  get("/update_photo/:photo_id", {:controller => "photos", :action => "edit"})

  get("/insert_comment_record", {:controller => "photos", :action => "insert_comment"})




end
