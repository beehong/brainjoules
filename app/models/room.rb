class Room < ApplicationRecord
	has_many :users, dependent: :nullify
   
 
end