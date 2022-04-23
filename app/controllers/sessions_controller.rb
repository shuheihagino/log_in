class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user&.authenticate(params[:session][:password])
            log_in(user)
            redirect_to tasks_path(user.id)
          else
            flash.now[:danger] = 'ログインに失敗しました'
            render :new
          end 
    end

    def destroy
        session.delete(:user_id)
        flash[:notice] = 'ログアウトしました'
        redirect_to new_session_path
      end

end
