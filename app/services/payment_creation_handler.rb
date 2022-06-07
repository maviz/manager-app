class PaymentCreationHandler
	attr_accessor :args

	def initialize(args)
		@args = JSON.parse(args).with_indifferent_access
	end

	def handle
		save_record
	end

	def save_record
		pr = PaymentReq.new.tap do |pr|
			pr.amount = args[:amount]
			pr.description = args[:description]
			pr.status = :pending
			pr.currency = args[:currency]
			pr.transaction_id = args[:trans_id]
		end
		pr.save
	end
end