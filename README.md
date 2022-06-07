> Two Ruby on Rails apps, one for managers and one for contractors.
	manager app repo url:

	contractor app reqo url: https://github.com/maviz/contractor-app
	
	manager app repo url: https://github.com/maviz/manager-app


> One RabbitMq server running via docker on the same machine.
I am using the community docker image for RabbitMq with port forwarding via following command, after installing docker

`docker run -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3.10-management`


> Both Rails apps use bunny gem to connect to the RabbitMQ server.

> The Contractor application has a Dispatcher in app/servicses/dispatcher.rb that sends the create event to the RabbitMQ server. Dispatcher's dispatch is called in the after_create model hook. 
> This publish uses the fanout exchange strategy for delivery i.e a message is sent to all the queues.
> On the Manager app, we have a subscriber that get the params for the newly created payment request from the Contractor app, A corresponding payment_request entity is created on the Manager app.

> When manager updates any payment_request, this is sent to the RabbitMQ server using the direct strategy with a routing key. This key is used for mapping with the queue. Contractor app has a subscription to the channel and it gets the message when Manager updates the payment_request. To have a link between payment_req on Contractor and Manager side, the payment request record on the manager side has an additional field called 'transaction_id' which save the hashed version of integer database id of the record. This helps in fetching the record for updation when a change event hits the contractor app.


> Contractor app has a dispatcher to dispatch create payment request events to RabbitMQ server. Manager app has a Subscriber that subscribes to the channel to get event notifications for the update event on payment_request by Manage.

> Manager app has a dipatcher to transmit update events and a subscriber to catch create events.





>> Installation / Running Steps for Ubuntu
 
1) Install docker

2) run local instance of RabbitMQ server by command :: docker run -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3.10-management

3) clone manager app :: git clone https://github.com/maviz/manager-app.git

4) bundle install, rails db:setup, rails db:migrate and rails s

5) clone contractor app :: git clone https://github.com/maviz/contractor-app.git

6) bundle install && rails db:setup && rails db:migrate && rails s -p 3001 (diffrent port)

create payment_request on contractor app, see logs and also can open rabbitMQ admin pannel, http://localhost:15672 , with [user: guest, password: guest] and see the message flow. Update a payment request publishes to a queue via direct strategy and create is published via fanout.

