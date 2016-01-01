class StaffMember < ActiveRecord::Base
 has_many :events, class_name: 'StaffEvent', dependent: :destroy

 before_validation do
    self.email_for_index = email.downcase if email
    self.staff_user_name_index = staff_user_name.downcase if staff_user_name
 end

 ENGLISH_REGEXP =/\A[A-Za-z0-9 ]*\z/

 validates :family_name, :given_name, presence: true
 validates :family_name_eng, :given_name_eng, presence: true,
           format: { with: ENGLISH_REGEXP, allow_blank: true}

 validates :start_date, presence: true, date: {
     after_or_equal_to: Date.new(2000, 1, 1),
     before: -> (obj) { 1.year.from_now.to_date },
     allow_blank: true
  }

 validates :end_date, date: {
    after: :start_date,
    before: -> (obj) { 1.year.from_now.to_date },
    allow_blank: true
 }

 validates :email, presence: true, email: { allow_blank: true }
 validates :email_for_index, uniqueness: { allow_blank: true }
 after_validation do
  if errors.include?(:email_for_index)
    errors.add(:email, :taken)
    errors.delete(:email_for_index)
  end
 end

 def password=(raw_password)
   if raw_password.kind_of?(String)
     self.hashed_password = BCrypt::Password.create(raw_password)
   else raw_password.nil?
     self.hashed_password = nil
   end
 end

 def active?
   !suspended? && start_date <= Date.today && (end_date.nil? || end_date > Date.today)
 end
end
