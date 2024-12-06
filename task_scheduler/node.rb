class Node
  attr_accessor :id, :name, :priority, :due_date, :status, :next

  def initialize(id, name, priority, due_date, status)
    @next = nil
    @id = id
    @name = name
    @priority = priority
    @due_date = due_date
    @status = status
  end
end
