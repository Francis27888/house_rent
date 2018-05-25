class HousePicturesController < ApplicationController
  before_action :set_house, only: [:new,:create,:index]
  before_action :set_house_picture, only: [:show, :edit, :update, :destroy,:set_house]
  before_action :authenticate_user!
  # GET /house_pictures
  # GET /house_pictures.json
  def index
    @house_pictures = @house.house_pictures.all
  end

  # GET /house_pictures/1
  # GET /house_pictures/1.json
  def show
  end

  # GET /house_pictures/new
  def new
    @house_picture = HousePicture.new
    @house=House.find_by(id: params[:house_id])
  end

  # GET /house_pictures/1/edit
  def edit
  end

  # POST /house_pictures
  # POST /house_pictures.json
  def create
    @house_picture = HousePicture.new(house_picture_params)
    @house_picture.house_id=@house.id
    respond_to do |format|
      if @house_picture.save
        format.html { redirect_to house_house_pictures_path(@house_picture.house_id), notice: 'House picture was successfully created.' }
        format.json { render :show, status: :created, location: house_house_pictures_path }
      else
        format.html { render new_house_house_picture_path(@house_picture.house_id) }
        format.json { render json: @house_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /house_pictures/1
  # PATCH/PUT /house_pictures/1.json
  def update
    respond_to do |format|
      if @house_picture.update(house_picture_params)
        format.html { redirect_to house_house_pictures_path(@house_picture.house_id), notice: 'House picture was successfully updated.' }
        format.json { render :show, status: :ok, location: house_house_picture_path }
      else
        format.html { render :edit }
        format.json { render json: @house_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /house_pictures/1
  # DELETE /house_pictures/1.json
  def destroy
    @house_picture.destroy
    respond_to do |format|
      format.html { redirect_to house_house_pictures_path(@house_picture.house_id), notice: 'House picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house_picture
      @house_picture = HousePicture.find(params[:id])
    end
    def set_house
      @house = House.find(params[:house_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_picture_params
      params.require(:house_picture).permit(:image)
    end
end