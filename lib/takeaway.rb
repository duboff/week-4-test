require 'twilio-ruby'

class Takeaway
  
  attr_reader :price_list

  def initialize(price_list)
    @price_list = price_list
  end

  def place_order(quantities, total)
    raise 'Quantities should be passed on as a hash' if quantities.class != Hash
    sum = quantities.keys.inject(0) {|result, key| result + price_list[key] * quantities[key] }
    raise 'The total appears to be wrong' if total != sum
    time = time_in_1_hour
    text = "Thank you for your order. We will deliver it before #{time.hour}:#{time.min}."
    send_text(text)
  end

  def time_in_1_hour
    Time.now + (60 * 60)
  end

  def send_text(text)
    account_sid = 'AC965151dcbe7db4009698c52c423e1d60'
    auth_token = 'e2d56b7f3fe8edf7c99fc766377c001b'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(
      :from => '+441792720314',
      :to => '+447595666228',
      :body => text
    )
  end

end