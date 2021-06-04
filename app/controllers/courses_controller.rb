class CoursesController < ApplicationController
  def index
    matching_courses = Course.all

    @list_of_courses = matching_courses.order({ :created_at => :desc })

    render({ :template => "courses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_courses = Course.where({ :id => the_id })

    @the_course = matching_courses.at(0)

    render({ :template => "courses/show.html.erb" })
  end

  def create
    the_course = Course.new
    the_course.description = params.fetch("query_description")
    the_course.school_id = params.fetch("query_school_id")
    the_course.schedule = params.fetch("query_schedule")
    the_course.quarter = params.fetch("query_quarter")
    the_course.title = params.fetch("query_title")
    the_course.course_number = params.fetch("query_course_number")
    the_course.section_number = params.fetch("query_section_number")
    the_course.program = params.fetch("query_program")
    the_course.comments_count = params.fetch("query_comments_count")
    the_course.studygroups_count = params.fetch("query_studygroups_count")

    if the_course.valid?
      the_course.save
      redirect_to("/courses", { :notice => "Course created successfully." })
    else
      redirect_to("/courses", { :notice => "Course failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_course = Course.where({ :id => the_id }).at(0)

    the_course.description = params.fetch("query_description")
    the_course.school_id = params.fetch("query_school_id")
    the_course.schedule = params.fetch("query_schedule")
    the_course.quarter = params.fetch("query_quarter")
    the_course.title = params.fetch("query_title")
    the_course.course_number = params.fetch("query_course_number")
    the_course.section_number = params.fetch("query_section_number")
    the_course.program = params.fetch("query_program")
    the_course.comments_count = params.fetch("query_comments_count")
    the_course.studygroups_count = params.fetch("query_studygroups_count")

    if the_course.valid?
      the_course.save
      redirect_to("/courses/#{the_course.id}", { :notice => "Course updated successfully."} )
    else
      redirect_to("/courses/#{the_course.id}", { :alert => "Course failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_course = Course.where({ :id => the_id }).at(0)

    the_course.destroy

    redirect_to("/courses", { :notice => "Course deleted successfully."} )
  end
end
