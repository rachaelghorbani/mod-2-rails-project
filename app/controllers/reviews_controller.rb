class ReviewsController < ApplicationController
    before_action :find_review, only: [:edit, :update]
    
    def new
        @review = Review.new
    end

    def create
            @review = Review.create(review_params)
           
        if @review.valid?
            redirect_to court_path(@review.court.id)
        else
            flash[:review_error] = @review.errors.full_messages
            redirect_to court_path(@review.court_id)
        end
    end

    def edit
        @current_player = Player.find_by(id: session[:player_id])
        @court = Court.find(params[:id])
    end

    def update
        if @review.update(review_params)
            redirect_to profile_path(@review.player_id)
        else
            flash[:review_errors] = @review.errors.full_messages
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
