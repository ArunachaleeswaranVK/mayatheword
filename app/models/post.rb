class Post < ActiveRecord::Base
    
    has_many :comments
    validates :title, presence: true, length: { minimum: 3}
    validates :content, presence: true
    
    def self.previous_post(previous_id)
        if previous_id
            where("id < ?", previous_id).order("id DESC").first 
        end
    end 
    
    def self.next_post(next_id)
        if next_id
            where("id > ?", next_id).order(:id).first 
        end
    end    
end
