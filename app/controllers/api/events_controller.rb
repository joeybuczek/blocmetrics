class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
#     @application = Application.last
#     @event = @application.events.build(name: "bypass")
#     @event.save
    @application = Application.find_by(url: request.env['HTTP_ORIGIN'])
    if @application.nil?
      render json: "Unregistered application: #{event_params}", status: :unprocessable_entity
    else
      @event = @application.events.build(name: event_params)
      if @event.save
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    end
  end
  
  private
  
  def event_params
    params.require(:name)
  end
  
  # Curl testing payload:
  # curl -v -H "Accept: application/json" -H "Origin: http://test.app.com" "Content-type: application/json" -X POST -d 'name=foobar' https://joey-blocmetrics.herokuapp.com/api/events
  
  # The params received from the above will look like this:
  # {"name"=>"foobar", "action"=>"create", "default"=>{"format"=>:json}, "controller"=>"api/events"}
  
end