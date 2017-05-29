class Post < ActiveRecord::Base
    
    has_many :comments ,dependent: :destroy
    acts_as_votable
    is_impressionable :counter_cache => true, :column_name => :view_count, :unique => :all
    validates :title, presence: true, length: { minimum: 3}
    validates :summary, presence: true, length: { maximum: 600 }
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
    
    def self.view_count(posts)
        return posts.sum(:view_count)
    end
    
    def self.like_count(posts)
        return posts.sum(:cached_votes_total)
    end    
end
