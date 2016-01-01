class Staff::Base < ApplicationController
before_action :authorize
before_action :check_account
before_action :check_timeout
  private
# 名前空間staffに属する全てのコントローラにcurrent_staff_memberという
# privateメソッドを与えるため、Staff::Baseというクラスを定義します。
# current_staff_memberは、現在ログインしているStaffMemberオブジェクトを
# 返すメソッド。				
  def current_staff_member
     if session[:staff_member_id]
       @current_staff_member ||=
         StaffMember.find_by(id: session[:staff_member_id])
     end
  end

  helper_method :current_staff_member

  def authorize
    unless current_staff_member
      flash.alert = 'Please Login for Staff!'
      redirect_to :staff_login
    end
  end

  def check_account
    if current_staff_member && !current_staff_member.active?
     session.delete(:staff_member_id)
     flash.alert = 'Can\'t Use This Account!!'
     redirect_to :staff_root
    end
  end
 
  TIMEOUT = 300.minutes

  def check_timeout
    if current_staff_member
     if session[:last_access_time] >= TIMEOUT.ago
        session[:last_access_time] = Time.current
     else
       session.delete(:staff_member_id)
       flash.alert = 'Session Time Out. Sign in Again!!'
       redirect_to :staff_root
     end
    end
  end
end
