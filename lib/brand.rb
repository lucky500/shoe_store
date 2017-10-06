class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, {:presence => true})
  validates(:price, {:presence => true})
  validates(:model, {:presence => true})
  validates(:model, {:uniqueness => true})
end