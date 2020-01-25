class AddManufacturerToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :manufacturer, :string
  end
end
