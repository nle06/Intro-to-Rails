class AddGroupToBreeds < ActiveRecord::Migration[6.0]
  def change
    add_reference :breeds, :group, foreign_key: true
  end
end
