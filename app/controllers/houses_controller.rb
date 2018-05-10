class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  def index
    @owner=User.find_by(id: current_user.id)
    @houses = House.all.where(user_id: current_user.id).order('created_at desc')

    respond_to do |format|
      format.html
      format.json { render json: @houses }
    end
  end
  
  def show
    @owner=User.find_by(id: @house.user_id)
  end
  def new
    if params[:back]
      @house = House.new(house_params)
    else
      @house = House.new
    end
    

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @house }
  end
  def confirm
    @house = House.new(house_params)
    render new_house_path if @house.invalid?
  end
  def edit
  end
  def create
    @user=User.find_by(id: current_user.id)
    @house = House.new(house_params)
    @house.booked_status="not booked"
    respond_to do |format|
      if @house.save
        HouseMailer.house_mail(@user,@house).deliver_later
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render json: @house, status: :created, location: @house }
      else
        format.html { render action: "new" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end
   def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'house was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    @house.destroy

    respond_to do |format|
      format.html { redirect_to houses_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def house_params
    params.require(:house).permit(:location,:number_of_rooms,:booked_status,:description).merge(user: current_user)
  end
  def set_house
    @house = House.find(params[:id])
  end
end
