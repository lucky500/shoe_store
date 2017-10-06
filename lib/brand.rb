class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates_presence_of :name, :price, :model
  validates(:model, {:uniqueness => true})
  validates_length_of :name, :model,  maximum: 100
  before_save(:capitalize_name)

  private def capitalize_name
    self.name = name.split(" ").each.map { |v| v.capitalize }.join(" ")
  end
end