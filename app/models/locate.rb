class Locate < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  has_many :locatecomments
  
  # def self.search(search) #ここでのself.はLocate.を意味する
  #   if search
  #     where(['name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。Locate.は省略
  #   else
  #     all #全て表示。Locate.は省略
  #   end
  # end
end
