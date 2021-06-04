class ProfessorsController < ApplicationController
  def index
    matching_professors = Professor.all

    @list_of_professors = matching_professors.order({ :created_at => :desc })

    render({ :template => "professors/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_professors = Professor.where({ :id => the_id })

    @the_professor = matching_professors.at(0)

    render({ :template => "professors/show.html.erb" })
  end

  def create
    the_professor = Professor.new
    the_professor.first_name = params.fetch("query_first_name")
    the_professor.last_name = params.fetch("query_last_name")
    the_professor.email = params.fetch("query_email")

    if the_professor.valid?
      the_professor.save
      redirect_to("/professors", { :notice => "Professor created successfully." })
    else
      redirect_to("/professors", { :notice => "Professor failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_professor = Professor.where({ :id => the_id }).at(0)

    the_professor.first_name = params.fetch("query_first_name")
    the_professor.last_name = params.fetch("query_last_name")
    the_professor.email = params.fetch("query_email")

    if the_professor.valid?
      the_professor.save
      redirect_to("/professors/#{the_professor.id}", { :notice => "Professor updated successfully."} )
    else
      redirect_to("/professors/#{the_professor.id}", { :alert => "Professor failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_professor = Professor.where({ :id => the_id }).at(0)

    the_professor.destroy

    redirect_to("/professors", { :notice => "Professor deleted successfully."} )
  end
end
