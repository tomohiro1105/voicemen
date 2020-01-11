class ChangeColumnToWord < ActiveRecord::Migration[5.2]
  def change
    # 変更内容
  def up
    change_column :words, :user, index: true, foreign_key: true
  end

  # 変更前の状態
  def down
    change_column :words, :user, foreign_key: true
  end
  end
end
