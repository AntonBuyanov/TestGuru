class Badge < ApplicationRecord

  RULE = %w[category first_attempt level].freeze

  has_many :users, through: :user_badges
  has_many :user_badges, dependent: :destroy

end
