class Country
  include Mongoid::Document

  field :name, type: String
  field :is_Active, type: Boolean

  has_many :states, dependent: :destroy,:autosave => true

end
