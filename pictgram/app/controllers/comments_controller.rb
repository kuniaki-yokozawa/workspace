class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
  end

  def create
     #binding.pry
     @comment = Comment.new(comment_params)
     @comment.user_id = @current_user.id
     if @comment.save
       redirect_to topics_path, success: "送信に成功しました"
     else
       flash.now[:danger] = "送信に失敗しました"
       render :new
     end
   end

   private
   def comment_params
     params.require(:comment).permit(:sentence, :topic_id)
   end
 end






















end
