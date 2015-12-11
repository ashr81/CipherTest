class State
  include Mongoid::Document
  field :name, type: String
  field :forestarea,type: Hash
  field :employment,type: Hash
  field :literacyrate,type: Hash
  field :mentowoman,type: Hash
end
