class ReviewsController < ApplicationController
    before_action :find_review, only: [:edit, :update]
    
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

    def edit
    end

    def update
        if @review.update(review_params)
            redirect_to player_path(@review.player_id)
        else
            flash[:errors] = @review.errors.full_messages
            redirect_to edit_review_path(@review)
        end
    end


    private

    def review_params
        params.require(:review).permit(:player_id, :review, :court_id, :rating)
    end

    def find_review
        @review = Review.find(params[:id])
    end

end
