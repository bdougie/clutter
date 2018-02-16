class Payment < ApplicationRecord
  belongs_to :user

  # def self.price
  #   if current_user.service == "Starter"
  #     return 150_00
  #   elsif current_user.service == "Standard"
  #     return 280_00
  #   elsif current_user.service == "Premium"
  #     return 390_00
  #   end
  # end

end
