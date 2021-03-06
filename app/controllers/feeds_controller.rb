class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.all
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
  end

  # GET /feeds/new
  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def confirm
    @feed = Feed.new(feed_params)
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)
    @feed.image.retrieve_from_cache! params[:cache][:image]
    @feed.save!
    if @feed.save
      redirect_to @feed, notice: 'Feed was successfully created.'
    else
      render 'new'
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    if @feed.update(feed_params)
      redirect_to @feed, notice: 'Feed was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy
    redirect_to feeds_url, notice: 'Feed was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:image,:image_cache)
    end
end
