class CurriculumsController < ApplicationController
  def index
    matching_curriculums = Curriculum.all

    @list_of_curriculums = matching_curriculums.order({ :created_at => :desc })

    render({ :template => "curriculums/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_curriculums = Curriculum.where({ :id => the_id })

    @the_curriculum = matching_curriculums.at(0)

    render({ :template => "curriculums/show.html.erb" })
  end

  def create
    the_curriculum = Curriculum.new
    the_curriculum.professor_id = params.fetch("query_professor_id")
    the_curriculum.course_id = params.fetch("query_course_id")

    if the_curriculum.valid?
      the_curriculum.save
      redirect_to("/curriculums", { :notice => "Curriculum created successfully." })
    else
      redirect_to("/curriculums", { :notice => "Curriculum failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_curriculum = Curriculum.where({ :id => the_id }).at(0)

    the_curriculum.professor_id = params.fetch("query_professor_id")
    the_curriculum.course_id = params.fetch("query_course_id")

    if the_curriculum.valid?
      the_curriculum.save
      redirect_to("/curriculums/#{the_curriculum.id}", { :notice => "Curriculum updated successfully."} )
    else
      redirect_to("/curriculums/#{the_curriculum.id}", { :alert => "Curriculum failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_curriculum = Curriculum.where({ :id => the_id }).at(0)

    the_curriculum.destroy

    redirect_to("/curriculums", { :notice => "Curriculum deleted successfully."} )
  end
end
