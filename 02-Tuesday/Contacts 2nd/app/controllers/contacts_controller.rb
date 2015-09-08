class ContactsController < ApplicationController

  def index
    @contact = Contact.create_ten_sorted_contacts
  end

  def new
    @contact = Contact.new
  end

  def show
    id = params[:id]
    @contact = Contact.find(id)
  end

  def create
    @contact = Contact.new(project_params)
    if @contact.save
      redirect_to("/contacts/#{@contact.id}")
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:contact).permit(:name, :address, :phone, :email)
  end

end
