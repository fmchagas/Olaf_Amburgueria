class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token, :valid_logged_admin

  layout 'login'

  def index;end

  def logar
    administrator = Administrator.where(email: params[:email], password: params[:password])
    if `administrator.count > 0`

      administrator = administrator.first
      time = params[:remember] == '1' ? 1.year.from_now : 30.minutes.from_now
      value = {
        id: administrator.id,
        name: administrator.name,
        email: administrator.email
      }
      cookies[:olaf_admin] = { value: value.to_json, expires: time, httponly: true }

      redirect_to '/admin'
    else
      flash[:error] = 'email ou senha inválidos'
      redirect_to '/login'
    end
  end

  def logout
    cookies[:olaf_admin] = nil
    redirect_to '/login'
  end
end
