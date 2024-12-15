class Task < ApplicationRecord
  include ActiveModel::Dirty
  belongs_to :status
  belongs_to :user

  validates_presence_of :user_id, :status_id, :title, :due_date
  validates :due_date, comparison: { greater_than: Time.now.to_date }
  validate :status_change, on: :update


  def status_change
    if (self.changes.include? "status_id") && (self.changes["status_id"].first > self.changes["status_id"].last)
      self.errors.add :status, " Can't allow status change to previous status"
    end
  end
end