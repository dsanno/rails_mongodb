class Answer
  include Mongoid::Document
  field :user_id, type: Integer
  field :enquete_id, type: String
end
