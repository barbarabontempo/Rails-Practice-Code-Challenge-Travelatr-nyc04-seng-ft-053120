class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts
    
    def five_most_recent_posts
        self.posts.order("created_at desc").limit(5)
    end

    def featured_post
        self.posts.order("likes").last
    end

    def average_blogger_age
        total_bloggers = self.bloggers.uniq.count
        sum_age = self.bloggers.uniq.map { |blogger| blogger.age }.sum
        ((sum_age * 1.0) / total_bloggers).to_i
    end

end