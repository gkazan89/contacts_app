class ContactsController < ApplicationController
  def contact_method
    @contact = Contact.third
    render "contact.json.jbuilder"
  end

  def all_contacts_method
    @contacts = Contact.all
    render "all_contacts.json.jbuilder"
  end

  def index
    @contacts = Contact.all
    render "all_contacts.json.jbuilder"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "contact.json.jbuilder"
  end  
end
