class StudygroupsController < ApplicationController
  def index
    matching_studygroups = Studygroup.all

    @list_of_studygroups = matching_studygroups.order({ :created_at => :desc })

    render({ :template => "studygroups/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_studygroups = Studygroup.where({ :id => the_id })

    @the_studygroup = matching_studygroups.at(0)

    matching_sgcomments = Sgcomment.where({ :studygroup_id => the_id})

    @list_of_sgcomments = matching_sgcomments.order({ :created_at => :desc })

    render({ :template => "studygroups/show.html.erb" })
  end

  def create
    the_studygroup = Studygroup.new
    the_studygroup.course_id      = params.fetch("query_course_id")
    the_studygroup.timeblock      = params.fetch("query_timeblock")
    the_studygroup.name           = params.fetch("query_name")
    the_studygroup.max_members    = params.fetch("query_max_members")
    the_studygroup.originator_id  = @current_user.id

    if the_studygroup.valid?
      the_studygroup.save
        the_member = Member.new
        the_member.user_id = @current_user.id
        the_member.studygroup_id = the_studygroup.id
        the_member.save
      redirect_to("/studygroups/#{the_studygroup.id}", { :notice => "Studygroup created successfully." })
    else
      redirect_to("/studygroups", { :notice => "Studygroup failed to create successfully." })
    end
  end

  def join
    the_id = params.fetch("path_id")
    the_studygroup = Studygroup.where({ :id => the_id }).at(0)
      the_member = Member.new
        the_member.user_id = @current_user.id
        the_member.studygroup_id = the_studygroup.id
        the_member.save
    redirect_to("/studygroups/" + the_studygroup.id.to_s, { :notice => "Successfully joined " + the_studygroup.name})
  end

  def update
    the_id = params.fetch("path_id")
    the_studygroup = Studygroup.where({ :id => the_id }).at(0)

    the_studygroup.course_id = params.fetch("query_course_id")
    the_studygroup.timeblock = params.fetch("query_timeblock")

    if the_studygroup.valid?
      the_studygroup.save
      redirect_to("/studygroups/#{the_studygroup.id}", { :notice => "Studygroup updated successfully."} )
    else
      redirect_to("/studygroups/#{the_studygroup.id}", { :alert => "Studygroup failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_studygroup = Studygroup.where({ :id => the_id }).at(0)

    the_studygroup.destroy

    redirect_to("/studygroups", { :notice => "Studygroup deleted successfully."} )
  end
end
