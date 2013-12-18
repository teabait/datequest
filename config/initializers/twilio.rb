module Twilio
  def self.client
    twilio_sid = "AC5b47aab6279975c232f1489625f36b43"
    twilio_token = "8af3210fdedeec8ed0a4d6857953f25b"
    twilio_phone_number = "4087067936"
    @client ||= Twilio::REST::Client.new twilio_sid, twilio_token
  end
end
