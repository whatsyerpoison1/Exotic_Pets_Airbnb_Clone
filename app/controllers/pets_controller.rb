class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      raise
      render :new
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

private

  def pet_params
    params.require(:pet).permit(:name, :species, :description)
  end
end
