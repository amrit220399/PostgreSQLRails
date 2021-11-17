class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string
    change_column :users, :mobile, :bigint
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
