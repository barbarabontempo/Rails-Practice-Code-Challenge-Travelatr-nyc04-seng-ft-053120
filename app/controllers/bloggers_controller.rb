class BloggersController < ApplicationController
    before_action :find_blogger, only: [:show]
    def new
        @blogger = Blogger.new   
        @errors = flash[:errors]
    end

    def create
        @blogger = Blogger.create(blogger_params)
        if @blogger.valid?
            redirect_to @blogger
        else 
            flash[:errors]= @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    def show
        
    end

    private
    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

    def find_blogger
        @blogger = Blogger.find(params[:id])
    end
end