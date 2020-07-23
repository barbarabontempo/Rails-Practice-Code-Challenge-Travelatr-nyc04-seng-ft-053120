class DestinationController < ApplicationController
    
    def index
        @destinations = Destination.all
    end

    def show 
        @destination = Destination.find(param[:id])
    end
end