class ContactsController < ApplicationController

  def index
    @contacts = Contact.sort_contacts
  end

  def show
    id = params[:id]
    @person = Contact.find_by(id: id)
    if @person.nil?
      render :error
    end
  end

  def add_contact
    render :add_contact
  end

  def create
    Contact.create(contact_params)
    redirect_to('/contact')
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :address, :phone, :email)
  end

end
