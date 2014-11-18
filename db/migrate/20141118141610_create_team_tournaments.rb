class CreateTeamTournament < ActiveRecord::Migration
  def change
    create_table :team_tournaments do |t|
      t.references :team, index: true
      t.references :tournament, index: true

      t.timestamps
    end
  end
end
