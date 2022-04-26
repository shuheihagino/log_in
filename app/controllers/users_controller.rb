class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          log_in(@user)
            redirect_to tasks_path(@user.id)
            # ユーザ登録に成功した場合の処理
          else
            render :new
            # ユーザ登録に失敗した場合の処理
          end
      end

      def show
        @user = User.find(params[:id])
      end

      def edit
        @user = User.find(params[:id])
      end

      def destroy
        @user.destroy
        redirect_to new_session_path
      end
      
      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
end
