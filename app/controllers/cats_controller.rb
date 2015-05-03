class CatsController < ApplicationController

    def index
        @cats = Cat.all
    end

    def new
        @cat = Cat.new
        @tags = Tag.all
        @cat_tags = []
    end

    def create
        @cat = Cat.create(cat_params)
        tags = params[:cat][:tags]
        tags.each do |t|
            # t.split!
            t.downcase!
            @cat.tags << Tag.find_or_create_by(name: t) unless t.blank?
        end
        redirect_to @cat
    end

    def edit
        @cat = Cat.find params[:id]
        @tags = Tag.all
        @cat_tags = parse_tags @cat.tags
        # render :json => @tags_str
    end

    def show
        @cat = Cat.find params[:id]
        search = @cat.breed.downcase
        search += search.include?('cat') ? '' : ' cat'
        @piclist = flickr.photos.search :text => search, :sort => "relevance", per_page: 20
        @pics = []
        for pic in @piclist do
            p = flickr.photos.getSizes photo_id: pic.id
            i = p.to_a.index {|i| i['label'] == 'Medium 640' }
            @pics << p[i] unless p[i].nil?
        end
        # render :json => @pics
    end

    def update
        @cat = Cat.update(params[:id],cat_params)
        @cat.tags.clear

        tags = params[:cat][:tags]
        tags.each do |t|
            # t.split!
            t.downcase!
            @cat.tags << Tag.find_or_create_by(name: t) unless t.blank?
        end
        redirect_to @cat
    end

    def destroy
        # render :json => (Cat.find params[:id])
        Cat.destroy params[:id]
        redirect_to cats_path
    end

    # def tag
    #     @tag = Tag.find_by_name(params[:tag])
    # end

    private

    def cat_params
        params.require(:cat).permit(:name,:breed,:description)
    end

    def parse_tags tags
        tags.map { |tag| tag.name }
    end

end