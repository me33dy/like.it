class Product < ActiveRecord::Base
  belongs_to :company
  has_many :product_promotions, foreign_key: "promoting_product_id"
  has_many :promoters, through: :product_promotions

  #set default order to show created newest first
  default_scope -> { order("created_at DESC") }

  validates :name, presence: true, length: { maximum: 50 }

  validates :requirement, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 1000000 }

  validates :reward, presence: true, length: { maximum: 50 }

  #ensure all products must be associated with a company
  validates :company_id, presence: true
  has_attached_file :image, :styles => { :medium => "300x303>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg']
end
