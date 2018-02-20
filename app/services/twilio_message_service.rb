class TwilioMessageService
  prepend SimpleCommand
  attr_reader :client, :msg, :from, :to

  def initialize(**args)
    @client = Twilio::REST::Client.new(ENV['TWILIO_USERNAME'], ENV['TWILIO_PASSWORD'])
    @msg = args[:msg]
    @from = args[:from] || ENV['SENDER_PHONE_NUMBER']
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
