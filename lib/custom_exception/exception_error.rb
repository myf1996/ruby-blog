class ExceptionError < StandardError
  attr_reader :status_code

  def initialize(message = 'Something Went Wrong! Internal Server Error', status=500)
    super(message)
    @status_code = status
  end
end