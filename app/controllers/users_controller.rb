class UsersController < ApplicationController

#to get the show view to work
def show
#@user is just an instance variable. 
#using find method on the user model to retrieve the user from the database
@user = User.find(params[:id])
end

#to get the new view to work (views > users > new.html.erb)
  def new
  	@user = User.new #to get signup form working
  end

	def create
		@user = User.new(user_params)  #defined further below
		if @user.save
		flash[:success] = "Welcome to the Sample App!" #:success key for a message indicating a successful result
		redirect_to @user #if signup is successful use the Rails method to redirect_to in order to redirect them to their profile page
		else
		render 'new'
	end
end

private #this is how Ruby makes a method Private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation) #a more secure way for user signup
		end


end
