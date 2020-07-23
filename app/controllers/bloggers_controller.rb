class BloggersController < ApplicationController
    before_action :find_blogger, only: [:show]
   
    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def create
        @blogger = Blogger.create(blogger_params)
        if @blogger
          redirect_to blogger_path(@blogger)
        else
            flash[:errors]=@blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    def new
        @blogger = Blogger.new
        @errors = flash[:errors]
    end

    def edit
        @blogger = Blogger.find(params[:id])
    end

    def update
        @blogger = Blogger.find(params[:id])
        @blogger.update(blogger_params)
        redirect_to blogger_path(@blogger)
    end

    def destroy
        @blogger = Blogger.find(params[:id])
        redirect_to bloggers_path
    end
    
    private
    
    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

end