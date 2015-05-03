class CreateCatsTags < ActiveRecord::Migration
  def change
    create_table :cats_tags do |t|
      t.references :cat, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
