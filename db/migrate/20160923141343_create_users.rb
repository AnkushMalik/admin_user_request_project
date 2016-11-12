class CreateUsers < ActiveRecord::Migration
  #this app was created by Ankush Malik github:  https://github.com/freakuency
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :email
      t.string   :password_digest
      t.text     :description

      t.timestamps
    end
  end
end
