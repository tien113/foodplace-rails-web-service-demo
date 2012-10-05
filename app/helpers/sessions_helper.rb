module SessionsHelper
  
  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def sign_in(user)
      session[:user_id] = user.id
    end
    
    def sign_out
      session[:user_id] = nil 
    end

  # helper_method :current_user
    
  protected 
    def signed_in?
      unless session[:user_id]
        flash[:notice] = "You need to sign in first."
        redirect_to root_url
        return false
      else
        return true
      end
    end
    
end
