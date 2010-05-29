class Post < ActiveRecord::Base
  attr_accessible :title
  
  has_attached_file :picture, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => ":attachment/:id/:style.:extension", :url => ":attachment/:id/:style.:extension"
end
