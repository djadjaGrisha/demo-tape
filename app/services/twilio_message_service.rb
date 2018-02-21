class TwilioMessageService
  prepend SimpleCommand
  attr_reader :client, :msg, :from, :to

  def initialize(**args)
    @client = Twilio::REST::Client.new(
      Rails.configuration.twilio_service['username'],
      Rails.configuration.twilio_service['password']
    )
    @msg = args[:msg]
    @from = args[:from] || Rails.configuration.twilio_service['sender_phone']
    @to = args[:to]
  end

  def call
    client.api.account.messages.create(
      from: from,
      to: to,
      body: msg
    )
  rescue StandardError => e
    Rails.logger.error e.message
    errors.add(:message, 'Can\'t send a message. Please try again')
    nil
  end
end
