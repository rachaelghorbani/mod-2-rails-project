class ReservationsController < ApplicationController
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

    def destroy
        reservation = Reservation.find(params[:id])
        reservation.destroy
    end

    private

    def reservations_params
        params.require(:reservation).permit(:player_id, :court_id, :date)
    end
end
