class CatsController < ApplicationController

    def index
        @cats = Cat.all
    end

    def new
        @cat = Cat.new
    end

    def create
        @cat = Cat.create(cat_params)
        redirect_to @cat
    end

    def edit
        @cat = Cat.find params[:id]
        # render :json => @cat
    end

    def show
        @cat = Cat.find params[:id]
        # render :json => @cat
    end

    def update
        @cat = Cat.update(params[:id],cat_params)
        redirect_to @cat
    end

    def destroy
        # render :json => (Cat.find params[:id])
        Cat.destroy params[:id]
        redirect_to cats_path
    end

    private

    def cat_params
        params.require(:cat).permit(:name,:breed,:description)
    end

end