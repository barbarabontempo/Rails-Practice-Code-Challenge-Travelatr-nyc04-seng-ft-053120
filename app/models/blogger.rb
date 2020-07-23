class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :age, numericality: { greater_than: 0}
  validates :bio, length: { minimum: 30}

  def total_likes
      self.posts.map { |post| post.likes}.sum
  end

  def featured_post
      self.posts.order("likes").last
  end

  def top_destinations
      hash = Hash.new(0)
      self.destinations.each do |destination|
          hash[destination] += destination.posts.count
      end
      hash.sort_by {|k,v| v}.map {|pair| pair[0]}.reverse[0..4]
  end
end