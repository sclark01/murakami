class Comment < ActiveRecord::Base
  belongs_to :article
  validates :name, presence: true
  validates :desc, presence: true
end
