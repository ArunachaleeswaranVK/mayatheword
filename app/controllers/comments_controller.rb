class CommentsController < ApplicationController
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        
        respond_to do |format|
            format.html { redirect_to post_path(@post) }
            format.js # render comments/create.js.erb
        end
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        
        respond_to do |format|
            format.html { redirect_to post_path(@post) }
            format.js # render comments/destroy.js.erb
        end    
        
    end
    
    private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
