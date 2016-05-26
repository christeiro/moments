class AddImageColumnsToMemories < ActiveRecord::Migration
  def change
    add_attachment :memories, :image
  end
end
