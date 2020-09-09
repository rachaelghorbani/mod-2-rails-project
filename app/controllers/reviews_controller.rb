class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end

    def create
            @review = Review.create(review_params)
        if @review.valid?
            redirect_to court_path(@review.court_id)
        else
            flash[:errors] = @review.errors.full_messages
            redirect_to court_path(@review.court_id)
        end
    end

    private

    def review_params
        params.require(:review).permit(:player_id, :review, :court_id, :rating)
    end
end
