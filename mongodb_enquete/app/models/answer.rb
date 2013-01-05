class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer
  field :enquete_id, type: String
  validates_presence_of :user_id, :enquete_id
end
