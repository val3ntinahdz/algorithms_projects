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
  # Parameters:
  # position: Index of the node to delete (1-based).
  # target_id: (Optional) ID to match for deletion.
  # Steps:
  # Handle an empty list:

  # Return early if @head.nil?.
  # Handle deletion of the head:

  # If position == 1, update @head to @head.next and return.
  # Traverse the list:

  # Use a loop to find the node at the given position or matching target_id.
  # Delete the node:

  # Update the next pointer of the prev node to skip the current node.
  # Handle out-of-bounds position:

  # If the loop completes without finding the target, print a message or handle gracefully.
    return unless @head

    if position == 1
      @head = @head.next
      return @head
    end

    current = @head
    prev = nil
    counter = 0

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
end
