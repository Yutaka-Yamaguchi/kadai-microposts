class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  
  def fav(micropost)
    self.favorites.find_or_create_by(micropost_id: micropost.id)
  end

  def unfav(micropost)
    favorite = selffavorites.find_by(user_id: micropost.id)
    favorite.destroy if favorite
  end

  def favoriting?(micropost)
    self.favoritings.include?(micropost)
  end
end
