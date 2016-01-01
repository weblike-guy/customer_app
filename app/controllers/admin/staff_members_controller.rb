class Admin::StaffMembersController < Admin::Base
  before_action :authorize

  def index
    @staff_members = StaffMember.order(:family_name_eng, :given_name_eng)
  end

  def show
    staff_member = StaffMember.find(params[:id])
    redirect_to [:edit, :admin, staff_member ]
  end

  def new
    @staff_member = StaffMember.new
  end

  def edit
    @staff_member = StaffMember.find(params[:id])
  end

  def create
    @staff_member = StaffMember.new(staff_member_params)
    if @staff_member.save
      flash.notice = 'Created New Staff'
      redirect_to :admin_staff_members
    else
      render action: 'new'
    end
  end

  def update
     @staff_member = StaffMember.find(params[:id])
     @staff_member.assign_attributes(staff_member_params)
     if @staff_member.save
       flash.notice = 'update sucess'
       redirect_to :admin_staff_members
     else
       render action: 'edit'
     end
  end

  def destroy
     staff_member = StaffMember.find(params[:id])
     staff_member.destroy!
     flash.notice = 'Delete acount..'
     redirect_to :admin_staff_members
  end


  private

  def staff_member_params
    params.require(:staff_member).permit(
      :email, :password, :family_name, :given_name, :family_name_eng, :given_name_eng, :staff_user_name, :start_date, :end_date, :suspended
    )
  end
end
