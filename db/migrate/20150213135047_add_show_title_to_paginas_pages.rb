class AddShowTitleToPaginasPages < ActiveRecord::Migration
  def change
    add_column :paginas_pages, :show_title, :boolean, :default => false
  end
end
