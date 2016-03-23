class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id

  validates :content, presence: true
  belongs_to :user
  belongs_to :post

  has_many :relationships, foreign_key: "parent_id", dependent: :destroy
  has_many :parents, through: :relationships

  default_scope{ order('created_at DESC') }
end
