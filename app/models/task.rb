class Task < ApplicationRecord
  has_many :focus_sessions, dependent: :destroy
end