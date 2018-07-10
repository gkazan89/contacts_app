class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    search_terms = params[:search]
    if search_terms
      @contacts = @contacts.where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?", "%" + search_terms + "%", "%" + search_terms + "%", "%" + search_terms + "%")    
    end
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
      bio: params[:bio],
      user_id: current_user.id
    )
    if @contact.save
      render "contact.json.jbuilder"
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.number = params[:number] || @contact.number
    @contact.email = params[:email] || @contact.email
    @contact.bio = params[:bio] || @contact.bio
    if @contact.save
      render "contact.json.jbuilder"
    else
      render json: {errors: @contact.errors.full_messages}, status: unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: {message: "Contact successfully destroyed!"}
  end
end
