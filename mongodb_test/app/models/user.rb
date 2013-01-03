class User
  include Mongoid::Document
  field :name, type: String
  field :age, type: Integer
  field :profile, type: String
end
