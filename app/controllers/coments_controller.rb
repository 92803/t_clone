class ComentsController < ApplicationController
  before_action :set_coment, only: [:show, :edit, :update, :destroy]

  # GET /coments
  def index
    @coments = Coment.all.order(created_at: :desc)
  end

  # GET /coments/1
  def show
    @coment = Coment.find_by(id: params[:id])
    @user = User.find_by(id: @coment.user_id)
    @favorite = current_user.favorites.find_by(coment_id: @coment.id)
  end

  # GET /coments/new
  def new
    if params[:back]
      @coment = Coment.new(coment_params)
      if params[:cache][:image] != ""
        @coment.image.retrieve_from_cache! params[:cache][:image]
      end
    else
      @coment = Coment.new
    end
  end

  # GET /coments/1/edit
  def edit
  end

  # POST /coments
  def create
    @coment = Coment.new(coment_params)
    @coment.user_id = current_user.id

    if params[:cache][:image] != ""
      @coment.image.retrieve_from_cache! params[:cache][:image]
      @coment.save!
    end

    if @coment.save
      ComentMailer.coment_mail(@coment).deliver
      redirect_to new_coment_path,
      notice: 'Coment was successfully created!'
    else
      render 'new'
    end
  end

  # PATCH/PUT /coments/1
  def update
    if @coment.update(coment_params)
      redirect_to coments_path,
      notice: 'Coment was successfully updated!'
    else
      render 'edit'
    end
  end

  # DELETE /coments/1
  def destroy
    if @coment.destroy
      redirect_to coments_path,
      notice: 'Coment was successfully destroyed!'
    end
  end

  def confirm
    @coment = Coment.new(coment_params)
    @coment.user_id = current_user.id
    render :new if @coment.invalid?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coment
      @coment = Coment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coment_params
      params.require(:coment).permit(:content,:image,:image_cache)
    end
end
