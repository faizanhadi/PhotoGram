class CreatePhotographer < ActiveRecord::Migration
  def change
    create_table :photographers do |t|
      t.string :pname
      t.string :email
      t.timestamps
    end
  end
end
