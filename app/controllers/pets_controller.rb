class PetsController < ApplicationController

  def index
    if params[:query]
      @pets = Pet.global_search(params[:query])
    else
      @pets = Pet.all
    end
  end

  def show
    @pet = Pet.find(params[:id])
    @pets = Pet.all
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      flash[:notice] = "Pet listing updated!"
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      flash[:notice] = "Pet listing created!"
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
  end

private

  def pet_params
    params.require(:pet).permit(:name, :species, :description, :price, photos:[])
  end
end
