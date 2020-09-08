class PlayersController < ApplicationController

    def index
        @players = Player.all
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

    private

    def player_params
        params.require(:player).permit(:name, :age, :level, :username, :password, :profile_picture, :address, :latitude, :longitude)
    end
end
