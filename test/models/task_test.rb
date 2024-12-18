require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should not save Task without :user_id, :status_id, :title, :due_date" do
    task = Task.new
    assert_not task.save
  end

  test "should find Task with user_id" do
    task = Task.where(user_id: 1).last
    assert task.save
  end

  test "should fail if saving task with due_date < created_at" do
    task = Task.first
    task.due_date = task.created_at - 1.days
    assert_not task.save, task.errors[:due_date]
  end

  test "should fail if saving task with status which is prev to current status" do
    task = Task.where(status_id: Status.find_by(name: "InReview")).last
    task.status = Status.find_by(name: "InProgress")
    assert_not task.save, task.errors[:status]
  end
end
