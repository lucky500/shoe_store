class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands) do |t|
      t.column(:name, :string)
      t.column(:model, :string)
      t.column(:price, :integer)

      t.timestamps
    end
  end
end
