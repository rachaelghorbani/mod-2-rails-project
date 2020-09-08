class ReviewsController < ApplicationController
    def new

    end

    def create

    end

    private

    def review_params
        params.require(:review).permit(:player_id, :review, :court_id)
    end
end
