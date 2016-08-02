class State
  include Mongoid::Document

  field :name, type: String
  field :is_Active, type: Boolean

  has_many :addresses
  belongs_to :country

end
