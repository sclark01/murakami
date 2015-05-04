class Discussion < ActiveRecord::Base
  belongs_to :comment
  has_many :replies
end
