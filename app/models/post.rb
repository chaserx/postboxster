class Post < ActiveRecord::Base
  #for pagination
  cattr_reader :per_page
  @@per_page = 1
  
  #has_attached_file :picture, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => ":attachment/:id/:style.:extension", :url => ":attachment/:id/:style.:extension"
  #has_attached_file :picture
  has_attached_file :picture, 
                  :url => ':s3_domain_url',
                  :path => 'assets/:class/:id/:style.:extension',
                  :storage => :s3,
                  :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
                  :bucket => "postbox-#{RAILS_ENV}"
  
  validates_attachment_content_type :picture, :content_type => ['image/gif', 'image/jpeg', 'image/png'], :on => :create, :unless => Proc.new { |post| post.picture_file_name.nil? }
  validates_attachment_size :picture, :less_than => 5.megabytes, :on => :create, :unless => Proc.new { |post| post.picture_file_name.nil? }, :message => "file must be less than 5 MB"
  
end
