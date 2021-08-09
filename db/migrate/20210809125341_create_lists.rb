class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      #t.データ型名　:カラム名
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
