class Dispatcher
	cattr_accessor :connection, :channel
	class << self
		def dispatch msg = {}, ex = nil
			Rails.logger.info "Hi i am sending the update!!!!!!!!!"
			event = channel.topic("payment_reqs")
			event.publish(msg.to_json, routing_key: "payment_reqs.update")
		end

		def channel
			@@channel ||= connection.create_channel
		end

		def connection
			@@connection ||= Bunny.new.tap { |con|  con.start }
		end
	end
end