# frozen_string_literal: true

# Room channel
class RoomChannel < ApplicationCable::Channel
  # Sucripción
  def subscribed
    stream_from "room_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
