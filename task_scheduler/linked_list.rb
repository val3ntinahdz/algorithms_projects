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

  def delete(position)
    return unless @head

    if position == 1
      @head = @head.next
      return @head
    end

    current = @head
    prev = nil
    counter = 1

    # Traverse the list to find the position
    while current && counter < position
      prev = current
      current = current.next
      counter += 1
    end

    if current # Now the position is valid
      prev.next = current.next
    else
      puts "The position #{position} is out of bounds!"
    end
  end

  def delete_by_attribute(target_id)
    return unless @head

    current = @head
    prev = nil

    # Find equality between current and target _id
    while current.id == target_id
       # Delete the head if current == @ head
      if current == @head
        @head = @head.next
      else
        prev.next = current.next # Otherwhise, set prev's next pointer to current's next pointer
      end
      return current # Node deleted
    end

    # Update pointers
    prev = current
    current = current.next
  end
end
