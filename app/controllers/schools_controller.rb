class SchoolsController < ApplicationController
  def index
    matching_schools = School.all

    @list_of_schools = matching_schools.order({ :created_at => :desc })

    render({ :template => "schools/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_schools = School.where({ :id => the_id })

    @the_school = matching_schools.at(0)

    render({ :template => "schools/show.html.erb" })
  end

  def create
    the_school = School.new
    the_school.name = params.fetch("query_name")

    if the_school.valid?
      the_school.save
      redirect_to("/schools", { :notice => "School created successfully." })
    else
      redirect_to("/schools", { :notice => "School failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_school = School.where({ :id => the_id }).at(0)

    the_school.name = params.fetch("query_name")

    if the_school.valid?
      the_school.save
      redirect_to("/schools/#{the_school.id}", { :notice => "School updated successfully."} )
    else
      redirect_to("/schools/#{the_school.id}", { :alert => "School failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_school = School.where({ :id => the_id }).at(0)

    the_school.destroy

    redirect_to("/schools", { :notice => "School deleted successfully."} )
  end
end
