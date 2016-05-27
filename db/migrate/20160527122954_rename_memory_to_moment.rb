class RenameMemoryToMoment < ActiveRecord::Migration
  def change
    rename_table :memories, :moments
  end
end
