class AddStateIdToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :state, :state_temp
    add_column :users, :state_id, :integer, null: false, default: ""

    User.all.each do |user|
      user_state = user.state_temp
      state = State.find_by(state_abbreviation: user_state)

      if state
        user.state_id = state.id
        puts "Attempting to save #{user.name} with State Abr: (#{state.state_abbreviation}) State ID: #{state.id}"
        user.save!
      else
        puts "Unable to add a state id to #{user.name} record#:(#{user.id})"
      end
    end

  end

  def self.down
    remove_column :users, :state_id
    rename_column :users, :state_temp, :state
  end
end
