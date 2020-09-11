class ApplicationController < ActionController::Base
     before_action :authorized

    def logged_in_player
        @current_player = Player.find_by(id: session[:player_id])
    end

    def authorized
        redirect_to login_path unless logged_in_player
    end

end
