class TwilioMessageService < BaseService
  attr_reader :client, :msg_body, :recipient_number

  def initialize(**args)
    @client = Twilio::REST::Client.new(ENV['TWILIO_USERNAME'], ENV['TWILIO_PASSWORD'])
    @msg_body = args[:msg_body]
    @recipient_number = args[:recipient_number]
  end

  def execute
    client.api.account.messages.create(
      from: ENV['SENDER_PHONE_NUMBER'],
      to: recipient_number,
      body: msg_body
    )
  rescue StandardError => e
    e
  end
end
