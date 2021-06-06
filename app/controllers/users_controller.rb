class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :last_name => :desc })

    render({ :template => "user_authentication/index.html.erb" })
  end
end