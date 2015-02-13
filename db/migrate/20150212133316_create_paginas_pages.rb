class CreatePaginasPages < ActiveRecord::Migration
  def change
    create_table :paginas_pages do |t|
      t.string :title
      t.text :text
      t.boolean :featured, :default => false

      t.timestamps null: false
    end
  end
end
