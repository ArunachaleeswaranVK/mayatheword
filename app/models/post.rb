class Post < ActiveRecord::Base
    
    has_many :comments
    acts_as_votable
    validates :title, presence: true, length: { minimum: 3}
    validates :content, presence: true
    
    has_attached_file :image, styles: { medium: "700x500#", small: "350x250>" } 
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    
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
    
    def self.search(search)
        if search
            where(["title LIKE ?","%#{search}%"])
        else
            all.order("CREATED_AT DESC")
        end 
    end 
end
