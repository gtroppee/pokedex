class FixColumnName < ActiveRecord::Migration
  def change
  	    rename_column :votes, :ip_adress, :ip_address
  end
end
