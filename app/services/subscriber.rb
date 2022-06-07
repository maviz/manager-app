class Subscriber
	cattr_accessor :connection, :channel
	class << self
		def subscribe
			Rails.logger.info "ok!!"
			ex = channel.fanout("payment_reqs.create")
			channel.queue("create_payment_reqs",   :auto_delete => true).bind(ex).subscribe do |delivery_info, metadata, payload|
  				puts "Got this ----> #{payload}"
  				PaymentCreationHandler.new(payload).handle
			end
		end

		def channel
			@@channel ||= connection.create_channel
		end

		def connection
			@@connection ||= Bunny.new.tap { |con|  con.start }
		end
	end
end
