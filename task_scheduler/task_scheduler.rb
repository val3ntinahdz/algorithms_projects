require_relative 'linked_list'

class TaskScheduler
  attr_accessor :tasks

  def initialize
    @tasks = LinkedList.new
  end

  def add_task(id, name, priority, due_date, status)
    @tasks.append(id, name, priority, due_date, status)
  end

  def show_tasks
    @tasks.display
  end

  def delete_task(id)
    @tasks.delete(id)
  end
end

# tests
scheduler = TaskScheduler.new
scheduler.add_task(1, "Complete linked list project", "High", "2024-12-15", "Pending")
scheduler.add_task(2, "Review lectures", "Medium", "2024-12-20", "Pending")
scheduler.add_task(3, "Prepare presentation", "Low", "2024-12-25", "Pending")
scheduler.add_task(4, "Do pilates", "Medium", "2024-12-06", "Completed")
scheduler.add_task(5, "Practice DSA", "High", "2024-12-06", "Completed")
scheduler.show_tasks
removed_task = scheduler.delete_task(5)
puts "Deleted task: #{removed_task.id} - #{removed_task.name}"
scheduler.show_tasks
