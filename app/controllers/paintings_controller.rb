class PaintingsController < ApplicationController

  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.find_by(id: params[:id])
  end

  def search
    if params[:query]
      @paintings = Painting.search(params[:query])
    else
      @paintings = Painting.all
    end
  end

end
