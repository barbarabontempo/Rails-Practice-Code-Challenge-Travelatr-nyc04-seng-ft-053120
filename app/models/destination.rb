class Destination < ApplicationRecord
    has_many :posts 
    has_many :bloggers, through: :posts 


    def most_liked_post
        post_hash = {}
        self.posts.each do |post|
          post_hash[post.title] = post.likes
        end
        most_liked = post_hash.max_by {|k, v| v}
        post = Post.all.find_by(title: most_liked[0])
    end
    
    def most_recent_posts
        # byebug
        ordered_by_date = self.posts.sort_by {|post| post.created_at}
        ordered_by_date[0..4]
    end
    
    def average_blogger_age
        ages = self.bloggers.uniq.map {|blogger| blogger.age}
        ages.inject {|sum, num| sum + num} / ages.length
    end

end
