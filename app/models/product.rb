class Product < ApplicationRecord
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  # default_scope {where :order => 'title'}
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :title, :uniqueness => true
  # validates :image_url, :format => {
  #     :with => %r{\.(gif|jpg|png)$}i,
  #     :message => 'must be a url for GIF,JPG,PNG image'}
  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'line Items present')
      return false
    end
  end
end
