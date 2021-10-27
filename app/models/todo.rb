class Todo < ApplicationRecord
  # belongs_to :user


  validates :title ,presence: false
  validates :completed_at ,presence: false
  validates :note ,presence: false
  enum priorty: [:High, :Medium, :Low]
end
