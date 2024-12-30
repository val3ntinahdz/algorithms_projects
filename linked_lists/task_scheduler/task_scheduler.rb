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

  def update(id, updates={})
    @tasks.get_update(id, updates)
  end
end

