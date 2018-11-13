class BlogsController < ApplicationController



	def index
		@blogs = Blog.all
	end

	def new
		@blog = Blog.new
	end

	def create
		blog = Blog.new(blog_params)
    blog.user_id = current_user.id
		if blog.save
			redirect_to "/"
		else
			render "blogs/new"
		end
	end

	def show
		# @blog = Blog.find(params[:id])
		current_blog
	end


	def edit
		current_blog
	end

	def update
		blog = Blog.find(params[:id])
		if blog.update(blog_params)
			redirect_to "/"
		else
			render "blogs/#{blog.id}/edit"
		end
	end

	def destroy
		blog = Blog.find(params[:id])
		if blog.destroy
			redirect_to "/"

		end
	end


private
def blog_params
	params.require(:blog).permit(:title, :content, :user_id)
end

end
