class CatsTags < ActiveRecord::Base
  belongs_to :cat
  belongs_to :tag

  validates_uniqueness_of :cat_id, scope: :tag_id

  validates :cat_id, presence: true

  validates :tag_id, presence: true

end
