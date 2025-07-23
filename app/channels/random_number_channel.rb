class RandomNumberChannel < ApplicationCable::Channel
  def subscribed
    stream_from "random_number_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
