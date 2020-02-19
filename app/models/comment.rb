class Comment < ApplicationRecord
    belongs_to :post, optional: true
    belongs_to :user
    
    validates_presence_of :comment  
end
