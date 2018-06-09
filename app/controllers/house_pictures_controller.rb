# frozen_string_literal: true
# HousePicturesController

class HousePicturesController < ApplicationController
  before_action :set_house, only: %i[new create index]
  before_action :set_house_picture, only: %i[show edit update destroy set_house]
  before_action :authenticate_user!

  def index
    @house_pictures = @house.house_pictures.all
  end

  def show; end

  def new
    @house_picture = HousePicture.new
  end

  def edit; end

  def create
    @house_picture = HousePicture.new(house_picture_params)
    @house_picture.house_id = @house.id
    respond_to do |format|
      if @house_picture.save
        format.html {
          redirect_to house_house_pictures_path(@house_picture.house_id),
                      notice: 'House picture was successfully created.'
        }
        format.json {
          render :show, status: :created, location: house_house_pictures_path
        }
      else
        format.html {
          render new_house_house_picture_path(@house_picture.house_id)
        }
        format.json {
          render json: @house_picture.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def update
    respond_to do |format|
      if @house_picture.update(house_picture_params)
        format.html {
          redirect_to house_house_pictures_path(@house_picture.house_id),
                      notice: 'House picture was successfully updated.'
        }
        format.json {
          render :show, status: :ok,
                        location: house_house_picture_path
        }
      else
        format.html { render :edit }
        format.json {
          render json: @house_picture.errors,
                 status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @house_picture.destroy
    respond_to do |format|
      format.html {
        redirect_to house_house_pictures_path(@house_picture.house_id),
                    notice: 'House picture was successfully destroyed.'
      }
      format.json { head :no_content }
    end
  end

  private

  def set_house_picture
    @house_picture = HousePicture.find(params[:id])
  end

  def set_house
    @house = House.find(params[:house_id])
  end

  def house_picture_params
    params.require(:house_picture).permit(:image)
  end
  
end