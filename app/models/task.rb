class Task < ApplicationRecord
  include ActiveModel::Dirty
  belongs_to :status
  belongs_to :user

  validates_presence_of :user_id, :status_id, :title, :due_date
  validate :due_date_change
  validate :status_change, on: :update


  def status_change
    if (self.changes.include? "status_id") && (self.changes["status_id"].first > self.changes["status_id"].last)
      self.errors.add :status, " Can't allow status change to previous status"
    end
  end

  def due_date_change
    if (self.changes.include? "due_date") && (self.due_date < (self.created_at || Time.now))
      self.errors.add :due_date, " Can't allow due_date before task creation date"
    end
  end
end
