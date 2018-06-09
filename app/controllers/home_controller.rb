class HomeController < ApplicationController
  def index
    @houses = House.text_search(params[:query]).page(params[:page]).per(6)
  end

  def another; end

  def search
    @locations = House.order(:location)
                      .where('location like ?', "%#{params[:term]}%")
    respond_to do |format|
      format.json { @locations }
    end
  end

end
