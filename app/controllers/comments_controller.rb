class CommentsController < ApplicationController

def list
	@comments = Comment.all
	# @blog = Blog.find(params[:blog_id])
end

def create
	@blog = Blog.find(params[:blog_id])
	@comment = current_user.comments.new(comment_params)
	@comment.blog = @blog
	if (@comment.save)
		redirect_to "/"
	else
		redirect_to "/blogs/#{params[:blog_id]}"
	end

end

def edit
		@blog = Blog.find(params[:blog_id])
		@comment = Comment.find(params[:id])

	end

def update
		comment = Comment.find(params[:id])
		if comment.update(comment_params)
			redirect_to "/"
		else
			render "blogs/#{blog.id}/edit"
		end
	end

private

def comment_params
	params.require(:comment).permit(:content, :blog_id, :user_id)
end



end
