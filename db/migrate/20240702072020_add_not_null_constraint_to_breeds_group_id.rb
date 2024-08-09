class AddNotNullConstraintToBreedsGroupId < ActiveRecord::Migration[6.0]
  def change
    change_column_null :breeds, :group_id, false
  end
end
