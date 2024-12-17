require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  # Add a new node to the end of the list
  def append(id, name, priority, due_date, status)
    new_node = Node.new(id, name, priority, due_date, status)

    unless @head
      @head = new_node
    else
      current = @head
      current = current.next while current.next # Traverse to the end of the list
      current.next = new_node # Add the new node
    end
  end

  # Display all nodes in the list
  def display
    # Set current to head
    current = @head
    while current
      puts "Id: #{current.id}, Name: #{current.name}, Priority: #{current.priority}, Due Date: #{current.due_date}, Status: #{current.status}"
      current = current.next
    end
  end

  def delete(id)
    # steps to delete a task by a given ID
    # 1. check if head exists, if so, return nil
    return unless @head

    if @head.id == id
      return @head
    end

    current = @head
    prev = nil

    while current && current.id != id
      prev = current
      current = current.next
    end

    if current # if current exists?
      removed_task = current # save the node to delete
      prev.next = current.next # skip the node in the list
      return removed_task
    else
      puts "task with ID #{id} doesn't exist!"
    end
  end

  def get_task(id)
    current = @head
    # while current is not nil
    while current 
      return current if current.id == id 
      current = current.next 
    end 
    nil # return nil in case no task with the given Id is found
  end

  def update_task(id, updates={}) # https://stackoverflow.com/questions/3337285/what-does-send-do-in-ruby
    task = get_task(id)

    updates.each do |key, value|
      task.send("#{key}=", value) if task.respond_to?("#{key}=") # https://stackoverflow.com/questions/6849722/confused-about-respond-to-vs-respond-to
    end 
  end

  # to do:
  # let user update tasks by property
  # build a UI (a simple CLI) to add, update, remove, and display tasks interactively.
  # implement recurring tasks (e.g., daily, weekly, monthly). Store the recurrence details and generate instances dynamically.
  # add a search feature to find tasks by keywords in their name or status.

  # def update_task(property)
  # end
end
