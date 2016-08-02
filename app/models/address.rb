class Address
  include Mongoid::Document

  field :firstName, type: String
  field :lastName, type: String
  field :email, type: String
  field :phoneNo, type: String
  field :address1, type: String
  field :address2, type: String
  field :street, type: String
  field :city, type: String
  field :zipCode, type: String

  belongs_to :state

end
