class Product < ActiveRecord::Base
  belongs_to :company

  validates :name, presence: true, length: { maximum: 50 }

  validates :requirement, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 1000000 }

  validates :reward, presence: true, length: { maximum: 50 }

  #ensure all products must be associated with a company
  validates :company_id, presence: true

end
