class AddSecondAppointmentToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :second_appointment, :datetime
  end
end
