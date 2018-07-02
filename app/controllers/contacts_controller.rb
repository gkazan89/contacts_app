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

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      number: params[:number],
      email: params[:email],
    )
    @contact.save
    render "contact.json.jbuilder"
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.number = params[:number] || @contact.number
    @contact.email = params[:email] || @contact.email
    @contact.save
    render "contact.json.jbuilder"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: {message: "Contact successfully destroyed!"}
  end
end
