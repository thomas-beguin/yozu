class Post < ApplicationRecord
  before_validation do
    update_attribute(:date, Date.today)
  end

  belongs_to :user
  has_many   :tags, dependent: :destroy

  validates :content, presence: true
  validates :content, uniqueness: { scope: [:user, :date] }
  validates :date, uniqueness: { scope: :user }
end
