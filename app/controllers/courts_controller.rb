class CourtsController < ApplicationController
    def index
        #@courts = Court.all
        # byebug
        if params[:borough] && params[:borough] == "Bronx"
            @courts = Court.bronx.order(:name) 
        elsif params[:borough] && params[:borough] == "Brooklyn"
                @courts = Court.brooklyn.order(:name)  
        elsif params[:borough] && params[:borough] == "Manhattan"
            @courts = Court.manhattan.order(:name) 
        elsif params[:borough] && params[:borough] == "Staten Island"
            @courts = Court.staten_island.order(:name) 
        elsif params[:borough] && params[:borough] == "Queens"
            @courts = Court.queens.order(:name) 
        elsif params[:borough] && params[:borough] == "All Boroughs"
            @courts = Court.order(:name)
        elsif params[:court_name]
            @courts = Court.where("name like ?", "%#{params[:court_name]}%")
        elsif 
            @courts = Court.order(:name)
        end

        # if params[:court_name]
        #     @courts = Court.where("name like ?", "%#{params[:court_name]}%")
        # else 
        #     @courts = Court.all
        # end
        
        # if params[:court_name]
        #     @courts = Court.search_by_name(params[:court_name])
        # else 
        #     @courts = Court.all
        # end
    end

    def show
        @court = Court.find(params[:id])
        @reservation = Reservation.new
        @current_player = Player.find_by(id: session[:player_id])
    end

end
