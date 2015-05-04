module SessionsHelper

  def sign_in(user)
    logger.debug "Iniciando sesión..."
    reset_session
    remember_token = SecureRandom.urlsafe_base64.to_s
    create_session_cookie(remember_token)
    user.update_attribute(:remember_token, Digest::SHA2.hexdigest(remember_token))
    current_user = user
    logger.debug "Sesión iniciada para #{user.id}"
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def sign_out
    logger.debug "Cerrando sesión..."
    current_user = nil
    delete_session_cookie
    reset_session
  end

  def signed_in?
    !current_user.nil?
  end

  def admin?
    return (signed_in? and (current_user.rank == 5))
  end

  private
    # lee cookie de sesión y busca al usuario en bd
    def user_from_remember_token
      remember_token = cookies.signed[:remember_token]
      User.find_by(remember_token: Digest::SHA2.hexdigest(remember_token)) if !remember_token.blank?
    end

    def create_session_cookie(remember_token)
      cookies.signed[:remember_token] = {
        value: remember_token,
        expires: 1.year.from_now
      }
    end

    def delete_session_cookie
      cookies.signed[:remember_token] = {
        value: nil,
        expires: 1.year.ago
      }
      cookies.delete :remember_token
    end
end