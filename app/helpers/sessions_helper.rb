module SessionsHelper
  
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
      @current_user = user
  end
  
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  
  def sign_out
     self.current_user = nil
     cookies.delete(:remember_token)
  end
  
  private
    def signed_in_user
      redirect_to signin_url, notice: "You need to sign in first." 
      unless signed_in?
      end
    end
  
end
