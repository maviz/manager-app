class CreatePaymentReqs < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_reqs do |t|
      t.integer :status
      t.integer :amount
      t.string :transaction_id
      t.text :description
      t.string :currency

      t.timestamps
    end
  end
end
