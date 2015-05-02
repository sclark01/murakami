class Comment < ActiveRecord::Base
  belongs_to :article
  has_many :discussions
  validates :name, presence: true
  validates :desc, presence: true
  validates :pageNum, presence: true
end
