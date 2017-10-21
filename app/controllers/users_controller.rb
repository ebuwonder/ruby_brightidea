class UsersController < ApplicationController
    def new
    end

    def create
        user = User.create(user_params)

        if user.valid?
            session[:user_id] = user.id

            return redirect_to '/ideas'
        end

        flash[:errors] = user.errors.full_messages

        return redirect_to :back
    end

    def show
        @user = User.find(params[:id])
        @ideas=Idea.where(user:@user)
        @ideas_liked=@user.ideas_liked
    end

    private
        def user_params
            params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
        end
end
