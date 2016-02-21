class ContactsController < ApplicationController
	
	def new
		@contact = Contact.new
	end # new, method or action

	def create
		@contact = Contact.new(contact_params)
			if @contact.save
				flash[:success] = "Message sent." 
				redirect_to new_contact_path
			else
				flash[:danger] = "Error occurred, message has not been sent."
				redirect_to new_contact_path
			end # if,else
	end # create method	or action

	private
		def contact_params
			params.require(:contact).permit(:name, :email, :comments)
		end # contact_params method or action
			# the line of code above puts the parameters in a "white list"

end