class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :amount, precision: 5, scale: 2
      t.references :author, null: false, foreign_key: {to_table: :users}
      
      t.timestamps
    end
  end
end
