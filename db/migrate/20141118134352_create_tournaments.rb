class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.text :desc
      t.datetime :date

      t.timestamps
    end
  end
end
