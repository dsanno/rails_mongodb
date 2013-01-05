class Enquete
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  embeds_many :questions
  validates_presence_of :name
end
