class RandomNumberBroadcastJob < ApplicationJob
  queue_as :default

  def perform
    loop do
      ActionCable.server.broadcast("random_number_channel", number: rand(1..100))
      sleep 3
    end
  end
end
