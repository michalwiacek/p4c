class Category < ApplicationRecord
  include AASM

  belongs_to :vertical
  has_many :courses
  
  validates :name, presence: true, uniqueness: true
  validates_with UniqNameValidator

  aasm :column => 'state' do
    state :active, initial: true
    state :inactive

    event :deactivate do
      transitions from: :active, to: :inactive
    end

    event :activate do
      transitions from: :inactive, to: :active
    end
  end
end
