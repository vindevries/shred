require 'messagebird'

module Messages
  CLIENT = MessageBird::Client.new(ENV['MESSAGE_BIRD_API'])
end