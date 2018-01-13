class AddAppointmentToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :appointment, :datetime
  end
end
