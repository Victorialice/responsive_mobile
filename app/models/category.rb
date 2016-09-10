class Category < ApplicationRecord
  default_scope  -> {order('created_at DESC')}
  validates :name, uniqueness: true
  #acts_as_tree order: "name"
  acts_as_nested_set
  has_attached_file :image,
    :styles => {:w120h100 => "120x100>", :w50h50 => "50x50>"},
    :url => "/system/categories/:id/:style.:extension",
    :path => ":rails_root/public/system/categories/:id/:style.:extension"
  validates_attachment_content_type :image, content_type: [/\Aimage/, "application/octet-stream"]
end
