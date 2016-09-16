class RsvpsController < ApplicationController
	before_filter :authenticate_user!, except: [:new, :thanks]

	def index
		event = Event.friendly.find(params[:event_id])
		@rsvps = event.rsvps

		@all_rsvps = @rsvps.count
		@declined = @rsvps.where(status: false).count
		@attending = @rsvps.where(status: true).count
	end

	def counter
		event = Event.friendly.find(params[:event_id])
		@rsvps = event.rsvps
	end

	def new
		event = Event.friendly.find(params[:event_id])
		@rsvp = event.rsvps.build
			respond_to do |format|
				format.html
			end
	end

	def create
		event = Event.friendly.find(params[:event_id])
		@rsvp = event.rsvps.create(rsvp_params)
		respond_to do |format|
			if @rsvp.save
        	format.html { redirect_to "/thanks" }
        	format.js
    		else
        	format.html { render :new }
        	format.js
      		end
    	end
	end

	def thanks
   		render params[:page]
  	end

  	def destroy
  		event = Event.friendly.find(params[:event_id])
		@rsvps = event.rsvps.find(params[:id])
		@rsvps.destroy

		redirect_to  event_rsvps_path
	end

private
	def rsvp_params
		params.require(:rsvp).permit(:status, :name, :message)
	end

end
