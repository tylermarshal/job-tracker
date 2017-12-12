class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.timestamps null: false
      t.references :job, foreign_key: true
    end
  end
end
