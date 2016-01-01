class Admin::Base < ApplicationController
 before_action :authorize
 before_action :check_account
 before_action :check_timeout

  private

   def current_administrator
      if session[:administrator_id]
        @current_administrator ||=
           Administrator.find_by(id: session[:administrator_id])
      end
   end

    helper_method :current_administrator

   def authorize
    unless current_administrator
      flash.alert = 'Please Login for Admin!'
      redirect_to :admin_login
    end
   end

   def check_account
     if current_administrator && !current_administrator.active?
      session.delete(:administrator_id)
      flash.alert = 'Can\'t Use Your ID Contact to Admin!!'
      redirect_to :admin_root
     end
   end

   TIMEOUT = 300.minutes

   def check_timeout
     if current_administrator
       if session[:last_access_time] >= TIMEOUT.ago
          session[:last_access_time] = Time.current
       else
          session.delete(:administrator_id)
          flash.alert = 'Session is Time Out!'
          redirect_to :admin_root
       end
     end
   end
end
