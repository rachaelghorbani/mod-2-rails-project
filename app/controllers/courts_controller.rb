class CourtsController < ApplicationController
    def index
        #byebug
        if session[:player_id]
        @current_player = Player.find(session[:player_id])
        end
        #byebug
        # if params[:nearby] && params[:nearby] == ""
            # @judys = Court.near([@current_player.latitude, @current_player.longitude], 4, units: :mi)
    # end
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
        elsif params[:distance] && params[:distance] == "1 Mile"
            @courts = Court.near([@current_player.latitude, @current_player.longitude], 1, units: :mi)
        elsif params[:distance] && params[:distance] == "2 Miles"
            @courts = Court.near([@current_player.latitude, @current_player.longitude], 2, units: :mi)
        elsif params[:distance] && params[:distance] == "5 Miles"
            @courts = Court.near([@current_player.latitude, @current_player.longitude], 5, units: :mi)
        # elsif params[:nearby]
        #     @courts = Court.near([@current_player.latitude, @current_player.longitude], 1, units: :mi)
        else
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
        @review = Review.new
        @current_player = Player.find_by(id: session[:player_id])
    end
###methods to edit weird courts
    # def edit
    #     @court = Court.find(params[:id])
    # end
    
    # def update
    #     @court = Court.find(params[:id])
    #    if @court.update(court_params)
    #     redirect_to court_path(@court)
    #    else
    #     redirect_to courts_path
    #     end
    # end

    # private

    # def court_params
    #     params.require(:court).permit(:prop_id, :name,:location, :phone, :number_of_courts, :indoor_outdoor, :court_type, :info, :latitude, :longitude)
    # end

end
