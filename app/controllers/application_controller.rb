class ApplicationController < ActionController::Base
  before_action :valid_logged_admin

  def valid_logged_admin
    if cookies[:olaf_admin].present?
      hash_admin = JSON.parse(cookies[:olaf_admin])

      if hash_admin['id'].present?
        administrators = Administrator.where(id: hash_admin['id'])
        if administrators.count > 0
          @administrator = administrators.first
          return
        end
      end
    end

    redirect_to '/login'
  end
  
end
