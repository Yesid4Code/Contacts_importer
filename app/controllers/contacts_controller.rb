class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to contacts_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to contacts_path
    end
  end
  
end
