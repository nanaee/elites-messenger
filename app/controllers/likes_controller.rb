class LikesController < ApplicationController
    def create
        like = Like.new
        like.user_id = current_user.id
        like.timeline_id = params[:timeline_id]
        like.save!
        redirect_to timelines_path
    end

end
