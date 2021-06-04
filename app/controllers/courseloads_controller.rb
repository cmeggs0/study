class CourseloadsController < ApplicationController
  def index
    matching_courseloads = Courseload.all

    @list_of_courseloads = matching_courseloads.order({ :created_at => :desc })

    render({ :template => "courseloads/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_courseloads = Courseload.where({ :id => the_id })

    @the_courseload = matching_courseloads.at(0)

    render({ :template => "courseloads/show.html.erb" })
  end

  def create
    the_courseload = Courseload.new
    the_courseload.user_id = params.fetch("query_user_id")
    the_courseload.course_id = params.fetch("query_course_id")

    if the_courseload.valid?
      the_courseload.save
      redirect_to("/courseloads", { :notice => "Courseload created successfully." })
    else
      redirect_to("/courseloads", { :notice => "Courseload failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_courseload = Courseload.where({ :id => the_id }).at(0)

    the_courseload.user_id = params.fetch("query_user_id")
    the_courseload.course_id = params.fetch("query_course_id")

    if the_courseload.valid?
      the_courseload.save
      redirect_to("/courseloads/#{the_courseload.id}", { :notice => "Courseload updated successfully."} )
    else
      redirect_to("/courseloads/#{the_courseload.id}", { :alert => "Courseload failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_courseload = Courseload.where({ :id => the_id }).at(0)

    the_courseload.destroy

    redirect_to("/courseloads", { :notice => "Courseload deleted successfully."} )
  end
end
