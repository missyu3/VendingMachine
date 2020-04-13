class ErrorMessage
  def initialize
    @message = String.new
    @flag = false
  end

private
  def queue(message)
    @message = message
    @flag = true
  end

  def dequeue
    puts(@message) if @flag
    @message = String.new
    @display = false
  end
end