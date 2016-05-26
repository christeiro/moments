class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :caption
    end
  end
end
