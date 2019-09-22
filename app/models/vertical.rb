class Vertical < ApplicationRecord
  include AASM

  has_many :categories
  
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
