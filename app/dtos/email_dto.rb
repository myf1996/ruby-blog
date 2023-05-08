class EmailDto
  attr_accessor :to, :content, :subject, :attachment

  def initialize(to:, content:, subject:, attachment: nil)
    @to = to
    @content = content
    @subject = subject
    @attachment = attachment
  end
end