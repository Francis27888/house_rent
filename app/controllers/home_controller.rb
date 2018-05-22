class HomeController < ApplicationController
  def index
     @houses = House.text_search(params[:query]).page(params[:page]).per(6)
    # @house_picture=HousePicture.all
    # @houses=HousePicture.joins("INNER JOIN houses ON houses.id = house_pictures.house_id").select("houses.id,houses.user_id,houses.location,houses.number_of_rooms,houses.description,house_pictures.image")
  end
  def another
    
  end
  def search
    @locations=House.order(:location).where("location like ?","%#{params[:term]}%")
    respond_to do |format|
      format.json {@locations}
    end
  end
end
