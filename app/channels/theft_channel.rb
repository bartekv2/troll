class TheftChannel < ApplicationCable::Channel
  def subscribed
    stream_from "theft_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
