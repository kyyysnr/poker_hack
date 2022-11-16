class CreateBankrolls < ActiveRecord::Migration[6.1]
  def change
    create_table :bankrolls do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :playtime
      t.integer :buy_in
      t.integer :cash_out

      t.timestamps
    end
  end
end
