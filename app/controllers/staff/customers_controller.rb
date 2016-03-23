class Staff::CustomersController < Staff::Base

 def index
   @customers = Customer.order(:family_name, :given_name).page(params[:page])
 end 

 def show
   @customer = Customer.find(params[:id])
 end

 def new
   @customer = Staff::CustomerForm.new
 end
end
