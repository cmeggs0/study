class MembersController < ApplicationController
  def index
    matching_members = Member.all

    @list_of_members = matching_members.order({ :created_at => :desc })

    render({ :template => "members/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_members = Member.where({ :id => the_id })

    @the_member = matching_members.at(0)

    render({ :template => "members/show.html.erb" })
  end

  def create
    the_member = Member.new
    the_member.user_id = @current_user.id
    the_member.studygroup_id = params.fetch("query_studygroup_id")

    if the_member.valid?
      the_member.save
      redirect_to("/members", { :notice => "Member created successfully." })
    else
      redirect_to("/members", { :notice => "Member failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_member = Member.where({ :id => the_id }).at(0)

    the_member.user_id = params.fetch("query_user_id")
    the_member.studygroup_id = params.fetch("query_studygroup_id")

    if the_member.valid?
      the_member.save
      redirect_to("/members/#{the_member.id}", { :notice => "Member updated successfully."} )
    else
      redirect_to("/members/#{the_member.id}", { :alert => "Member failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_member = Member.where({ :id => the_id }).at(0)

    the_member.destroy

    redirect_to("/members", { :notice => "Member deleted successfully."} )
  end
end
