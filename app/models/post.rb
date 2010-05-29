class Post < ActiveRecord::Base

  
  #has_attached_file :picture, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => ":attachment/:id/:style.:extension", :url => ":attachment/:id/:style.:extension"
  #has_attached_file :picture
  has_attached_file :picture, 
                  :url => ':s3_domain_url',
                  :path => 'assets/:class/:id/:style.:extension',
                  :storage => :s3,
                  :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
                  :bucket => "postbox-#{RAILS_ENV}"
end
