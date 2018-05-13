class HomeController < ApplicationController
  def index
     @houses = House.all
    # @house_picture=HousePicture.all
    # @houses=HousePicture.joins("INNER JOIN houses ON houses.id = house_pictures.house_id").select("houses.id,houses.user_id,houses.location,houses.number_of_rooms,houses.description,house_pictures.image")
  end
  def another
    
  end
end
