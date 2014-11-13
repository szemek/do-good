class InboundEmailCreator
  def self.create(request)
    message = JSON.parse(request.body.read)

    InboundEmail.create({
      content: message['TextBody'],
      sender: message['From']
    })
  end
end
