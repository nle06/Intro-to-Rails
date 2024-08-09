class BreedsController < ApplicationController
  def index
    @breeds = Breed.all
    @breeds = @breeds.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
    @breeds = @breeds.where(group_id: params[:group_id]) if params[:group_id].present?
    @breeds = @breeds.page(params[:page]).per(10)
  end

  def show
    @breed = Breed.find(params[:id])
  end
end
