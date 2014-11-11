class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :pokemon, index: true
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
