class AddRefToPaginasPages < ActiveRecord::Migration
  def change
    add_reference :paginas_pages, :category, index: true
  end
end
