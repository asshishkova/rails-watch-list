class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'list was successfully created.'
    else
      render :new
    end
  end

  def show
    # @bookmark = Bookmark.new
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
