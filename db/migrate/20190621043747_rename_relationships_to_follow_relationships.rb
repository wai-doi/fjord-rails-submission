class RenameRelationshipsToFollowRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_table :relationships, :follow_relationships
  end
end
