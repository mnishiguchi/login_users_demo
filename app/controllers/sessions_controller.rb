class SessionsController < ApplicationController

  def new
  end

  def create

    if request.env['omniauth.auth']
      ap request.env['omniauth.auth']

      begin
        identity = Identity.from_omniauth(request.env['omniauth.auth'])
        session[:user_id] = identity.id
        flash[:success] = "Successfully authenticated with #{request.env['omniauth.auth']["provider"].capitalize}"
      rescue
        flash[:warning] = "There was an error while trying to authenticate you."
      end
      redirect_to(root_path) and return
    end


    email, password = session_params.slice(:email, :password).values

    identity = Identity.find_by(email: email.downcase)

    if identity&.authenticate(password)
      ap "Authentication success"
      if identity&.backend_user
        ap "Login as a backend user"
        log_in(identity)
        flash[:success] = "Successfully logged in as a backend user"
        redirect_to root_url
      elsif identity&.user
        ap "Login as a frontend user"
        log_in(identity)
        flash[:success] = "Successfully logged in as a frontend user"
        redirect_to identity.user
      else
        raise "Neither backend_user nor user"
      end
    else
      ap "Authentication failed"
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    log_out
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end
