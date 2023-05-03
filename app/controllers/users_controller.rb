class UsersController < ApplicationController

  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username =>:asc})
    
    render ({ :template => "user_template/index.html.erb"})
  end

  def detail 
    # Parameters: {"username"=>"anisa"}
    input_username = params.fetch("username")
    matching_username = User.where({:username=> input_username})
    @user = matching_username.at(0)

    if @user == nil
      redirect_to("/404")
    else
      render ({ :template => "user_template/detail.html.erb"})
    end
  end

  def create_user
    #   Parameters: {"input_username"=>"anisa"}
    input_username = params.fetch("input_username")
    new_user = User.new
    new_user.username = input_username
    new_user.save

    # render ({ :template => "photo_template/test.html.erb"})
    redirect_to("/users/"+ new_user.username)
  end

  def update_user
    #  Parameters: {"input_username"=>"augustine", "user_id"=>"109"}
    input_username = params.fetch("input_username")
    user_id = params.fetch("user_id")
    updated_user = User.where({:id =>user_id}).at(0)
    updated_user.username = input_username
    updated_user.save

    redirect_to("/users/"+ updated_user.username)
  end

end
