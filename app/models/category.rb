class Category < ApplicationRecord
  default_scope  -> {order('position ASC')}
  validates :position, uniqueness: true
  validates :name, uniqueness: { scope: :parent_id }
  #acts_as_tree order: "name"
  has_many :prod_categories
  has_many :products, through: :prod_categories
  has_and_belongs_to_many :industries
  
  acts_as_nested_set
  has_attached_file :image,
    :styles => {:w120h100 => "120x100>", :w50h50 => "50x50>"},
    :url => "/system/categories/:id/:style.:extension",
    :path => ":rails_root/public/system/categories/:id/:style.:extension"
  validates_attachment_content_type :image, content_type: [/\Aimage/, "application/octet-stream"]

  def self_and_descendants_id
    self_and_descendants.map(&:id)  
  end
end
