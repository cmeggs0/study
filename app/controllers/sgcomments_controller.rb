class SgcommentsController < ApplicationController
  def index
    matching_sgcomments = Sgcomment.all

    @list_of_sgcomments = matching_sgcomments.order({ :created_at => :desc })

    render({ :template => "sgcomments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_sgcomments = Sgcomment.where({ :id => the_id })

    @the_sgcomment = matching_sgcomments.at(0)

    render({ :template => "sgcomments/show.html.erb" })
  end

  def create
    the_sgcomment = Sgcomment.new
    the_sgcomment.user_id = params.fetch("query_user_id")
    the_sgcomment.studygroup_id = params.fetch("query_studygroup_id")

    if the_sgcomment.valid?
      the_sgcomment.save
      redirect_to("/sgcomments", { :notice => "Sgcomment created successfully." })
    else
      redirect_to("/sgcomments", { :notice => "Sgcomment failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_sgcomment = Sgcomment.where({ :id => the_id }).at(0)

    the_sgcomment.user_id = params.fetch("query_user_id")
    the_sgcomment.studygroup_id = params.fetch("query_studygroup_id")

    if the_sgcomment.valid?
      the_sgcomment.save
      redirect_to("/sgcomments/#{the_sgcomment.id}", { :notice => "Sgcomment updated successfully."} )
    else
      redirect_to("/sgcomments/#{the_sgcomment.id}", { :alert => "Sgcomment failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_sgcomment = Sgcomment.where({ :id => the_id }).at(0)

    the_sgcomment.destroy

    redirect_to("/sgcomments", { :notice => "Sgcomment deleted successfully."} )
  end
end
