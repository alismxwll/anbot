class ChangeSitesTable < ActiveRecord::Migration
  def change

    drop_table :sites

    create_table :sites do |t|
      t.string :title, null: false, default: ''
      t.integer :user_id
      t.timestamps
    end

  end
end
