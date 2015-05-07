class Reply < ActiveRecord::Base
  belongs_to :discussion, :order => "created_at DESC"
end
