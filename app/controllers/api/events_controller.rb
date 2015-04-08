class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    @application = Application.find_by(url: request.env['HTTP_ORIGIN'])
    if @application.nil?
      render json: "Unregistered application: #{params}", status: :unprocessable_entity
    else
      @event = @application.events.build(event_params)
      if @event.save
        # render json: @event, status: :created
      else
        # render @event.errors, status: :unprocessable_entity
      end
    end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:name)
  end
  
  # curl -v -H "Accept: application/json" -H "Origin: http://test.app.com" "Content-type: application/json" -X POST -d '{"name":"foobar"}' http://localhost:3000/api/events
  
end