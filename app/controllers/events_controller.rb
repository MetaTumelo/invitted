class EventsController < ApplicationController
	before_filter :authenticate_user!, except: [:show]

	def index
		@events = current_user.events.all
	end

	def show
		@event = Event.friendly.find(params[:id])
	end

	def new
		@event = current_user.events.build
	end

	def create
		@event = current_user.events.build(event_params)
		@event.user = current_user
		respond_to do |format|
			if @event.save
				format.html { redirect_to @event, notice: "Successfully created" }
			else
				format.html { render "new" }
			end
		end
	end

	def edit
		@event = Event.friendly.find(params[:id])
	end

	def update
		@event = Event.friendly.find(params[:id])
		if @event.update(event_params)
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
		@event = Event.friendly.find(params[:id])
		@event.destroy

		redirect_to events_path
	end

private
  
  def event_params
    params.require(:event).permit(:eventname, :date, :time, :venue, :description, :image)
  end

end
