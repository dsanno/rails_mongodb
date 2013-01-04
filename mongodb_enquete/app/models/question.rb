class Question
  include Mongoid::Document
  field :body, type: Object
  field :type, type: String
  field :choices, type: Array
  field :required_column, type: Boolean
end
