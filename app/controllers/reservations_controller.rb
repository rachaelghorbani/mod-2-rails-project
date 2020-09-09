class ReservationsController < ApplicationController
    before_action :find_reservation, only: [:edit, :update, :destroy]
    
    def new
        @reservation = Reservation.new
    end

    def create
            @reservation = Reservation.create(reservations_params)
        if @reservation.valid?
            redirect_to player_path(@reservation.player_id)
        else
            flash[:errors] = @reservation.errors.full_messages
            redirect_to new_reservation_path
        end
    end

    def edit
    end

    def update
        @reservation.update(reservations_params)
        redirect_to player_path(@reservation.player)
    end

    def destroy
        player = @reservation.player_id
        @reservation.destroy
        redirect_to player_path(player)
    end

    private

    def reservations_params
        params.require(:reservation).permit(:player_id, :court_id, :date)
    end

    def find_reservation
        @reservation = Reservation.find(params[:id])
    end

end
