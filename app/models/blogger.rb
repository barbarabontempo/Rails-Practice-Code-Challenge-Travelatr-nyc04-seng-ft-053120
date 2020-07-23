class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    
    validates :name, uniqueness: true
    validates :name, presence: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
      # byebug
      if self.posts.length > 1
        likes = self.posts.map {|post| post.likes}
        # byebug
        return likes.compact.inject{|sum, num| sum + num}
      end
      return nil
    end
  
    def most_liked_post
      post_hash = {}
      liked_posts = self.posts.where.not(likes: nil)
      liked_posts.each do |post|
        post_hash[post.title] = post.likes
      end
      most_liked = post_hash.max_by {|k, v| v}
      post = Post.all.find_by(title: most_liked[0])
    end

    # def top_destination #users top 5 posts that they have written
    #     hash = Hash.new(0)
    #     self.destinations.each.do |destination|
    #         hash[destination] += destination.posts.count
    #     end
    #     hash.sort_by { |k, v| }.map { |pair| pair(0)}.reverse[0..4]
    # end

end



