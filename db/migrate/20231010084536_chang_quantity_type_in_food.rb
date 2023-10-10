class ChangQuantityTypeInFood < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :quantity, :decimal
  end
end
