class Contact < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  
  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def full_name
    full_name = "#{first_name} #{last_name}"
  end
end
