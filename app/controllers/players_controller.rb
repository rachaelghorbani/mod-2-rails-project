class PlayersController < ApplicationController

    def index  
        @current_player = Player.find(session[:player_id]) 
        if params[:distance] && params[:distance] == "1 Mile"
            @players =  @current_player.nearbys(1)
        elsif params[:distance] && params[:distance] == "5 Miles"
            @players = @current_player.nearbys(5)
        elsif params[:distance] && params[:distance] == "10 Miles"
            @players = @current_player.nearbys(10)
        else
            @players = Player.all
        end   
    end

    def show
        #@player = Player.find(@current_player)
        @player = Player.find(params[:id])
    end

    def new
        @player = Player.new
    end

    def create
        @player = Player.create(player_params)
        byebug
            if @player.valid?
                session[:player_id] = @player.id
                redirect_to player_path(@player)
            else
                flash[:errors] = @player.errors.full_messages
                redirect_to new_player_path
            end
    end

    def edit
        @player = Player.find(parans[:id])
    end

    def update
        @player = Player.find(params[:id])
        if @player.update(player_params)
            redirect_to player_path(player)
        else
            flash[:errors] = @player.errors.full_messages
            redirect_to players_path ###where to direct??
end
    end

    def destroy
        @player = Player.find(params[:id])
        @player.destroy

    end

    def add_friend
    
        # @player = Player.find(session[:player_id])
        # friend = Player.find(params[:id])
        # @player.followees << friend
        redirect_to players_path
    end

    private

    def player_params
        params.require(:player).permit(:name, :age, :level, :username, :password, :profile_picture, :address, :latitude, :longitude)
    end
end
