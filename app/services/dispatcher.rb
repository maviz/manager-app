class Dispatcher
	cattr_accessor :connection, :channel
	class << self
		def dispatch msg = {}, ex = nil
			Rails.logger.info "Hi i am sending the update!!!!!!!!!"
			event = channel.direct("payment_reqs.update")
			event.publish(msg.to_json)
		end

		def channel
			@@channel ||= connection.create_channel
		end

		def connection
			@@connection ||= Bunny.new.tap { |con|  con.start }
		end
	end
end