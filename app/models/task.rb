class Task < ApplicationRecord
  belongs_to :user

  validates :title, :status, :due_date, presence: true
end