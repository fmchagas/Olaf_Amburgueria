class Customer < ApplicationRecord
  #validates_presence_of :cpf, :email, :name, :phone
  validates :cpf, :email, :name, :phone, presence: :true
end
