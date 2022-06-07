class PaymentReq < ApplicationRecord
	enum status: [:pending, :accepted, :rejected]

	after_update :dispatch_update_event

	private 

	def dispatch_update_event
		Dispatcher.dispatch(self.attributes)
	end

end
