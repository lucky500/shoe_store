require('spec_helper')

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:price) }

  it { should validate_presence_of(:model) }

  it { should validate_uniqueness_of(:model) }

  it { should validate_length_of(:name).is_at_most(100)}

  it { should validate_length_of(:model).is_at_most(100)}

  describe("#capitalize_name") do
    it("capitalizes the name of the brand") do
      new_brand = Brand.create({:name => "nike"})
      expect(new_brand.name()).to(eq("Nike"))
    end
  end
end