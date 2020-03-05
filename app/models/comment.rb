class Comment < ApplicationRecord
    
    validates :comment, presence: true
    validates :user_id, presence: true

    belongs_to :post
    belongs_to :user

end
