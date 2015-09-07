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


end
