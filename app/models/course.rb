class Course < ApplicationRecord
  include AASM

  belongs_to :category
  belongs_to :author

  validates :name, presence: true

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
