class PostsController < ApplicationController
    
    
    before_action :set_post , only: [:show,:edit,:update,:destroy,:upvote]
    before_action :authenticate_user! , except: [:index,:show,:upvote]
    
    def index
        @posts = Post.search(params[:search]).order("CREATED_AT DESC")
       
    end
    
    def show
        @previous = Post.previous_post(params[:id])  
        @next = Post.next_post(params[:id])
        @comments = @post.comments
        impressionist(@post)
    end    
    
    def new
       @post = Post.new 
    end    
    
    def create
       @post = Post.new(post_params) 
        
        if @post.save
           flash[:success] = "Post Created !"
           redirect_to root_path
        else
            render "new"
        end    
    end
    
    def edit
    
    end
    
    def update
        if @post.update(post_params)
            flash[:success] = "Post has been updated !"
            redirect_to @post
        else
            render "edit"
        end    
    end
    
    def destroy
        @post.destroy
        flash[:success] = "Post has been deleted !"
        redirect_to root_path
    end
    
    def upvote
        voter = guest_user
        @post.upvote_by voter
        
        redirect_to :back
    end    
    
    
    private
    
    def set_post
        @post = Post.find(params[:id])    
    end    
    
    def post_params
        params.require(:post).permit(:title,:content,:image,:summary)
    end    
        
end
