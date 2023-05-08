require 'sendgrid-ruby'
include SendGrid

def send_email(dto)
  puts "Sending email to #{dto.to} with subject #{dto.subject} and content #{dto.content}"

  from = Email.new(email: 'yassar.upwork@gmail.com')
  to = Email.new(email: dto.to)
  content = Content.new(type: 'multipart/related', value: dto.content)

  mail = Mail.new(from, dto.subject, to, content)

  personalization = Personalization.new
  personalization.add_to(to)
  mail.add_personalization(personalization)
  # Add text/plain content
  # mail.add_content(Content.new(type: 'text/plain', value: text_content))

  # Add attachments
  # if email_dto.attachment
  #   attachment = email_dto.attachment
  #   mail.attachments[attachment.original_filename] = attachment.read
  # end

  # attachments.each do |attachment|
  #   attachment_file = Base64.strict_encode64(File.read(attachment))
  #   attachment_name = File.basename(attachment)
  #   attachment_type = MIME::Types.type_for(attachment_name).first.to_s
  #   mail.add_attachment(
  #     Attachment.new(
  #       content: attachment_file,
  #       filename: attachment_name,
  #       type: attachment_type,
  #       disposition: 'attachment'
  #     )
  #   )
  # end

  sg = SendGrid::API.new(api_key: 'API_KEY')

  begin
    puts "===========to_json: #{mail.to_json}"
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts "Status code: #{response.status_code}"
    puts "Body: #{response.body}"
    puts "Headers: #{response.headers}"
  rescue Exception => e
    puts e.message
  end
end
