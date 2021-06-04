class CommentsController < ApplicationController
  def index
    matching_comments = Comment.all

    @list_of_comments = matching_comments.order({ :created_at => :desc })

    render({ :template => "comments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_comments = Comment.where({ :id => the_id })

    @the_comment = matching_comments.at(0)

    render({ :template => "comments/show.html.erb" })
  end

  def create
    the_comment = Comment.new
    the_comment.course_id = params.fetch("query_course_id")
    the_comment.comment = params.fetch("query_comment")
    the_comment.user_id = params.fetch("query_user_id")

    if the_comment.valid?
      the_comment.save
      redirect_to("/comments", { :notice => "Comment created successfully." })
    else
      redirect_to("/comments", { :notice => "Comment failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.course_id = params.fetch("query_course_id")
    the_comment.comment = params.fetch("query_comment")
    the_comment.user_id = params.fetch("query_user_id")

    if the_comment.valid?
      the_comment.save
      redirect_to("/comments/#{the_comment.id}", { :notice => "Comment updated successfully."} )
    else
      redirect_to("/comments/#{the_comment.id}", { :alert => "Comment failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.destroy

    redirect_to("/comments", { :notice => "Comment deleted successfully."} )
  end
end
