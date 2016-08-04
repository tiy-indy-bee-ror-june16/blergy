class MakeAddendumsPolymorphic < ActiveRecord::Migration[5.0]
  def change
    rename_column :addendums, :post_id, :commentable_id
    add_column :addendums, :commentable_type, :string, default: 'Post'
  end
end
