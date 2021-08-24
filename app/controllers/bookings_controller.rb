class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_pet, only: [:new, :create]

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    flash[:notice] = @booking.errors.full_messages.to_sentence unless @booking.save
    redirect_to pet_booking_path(@pet, @booking)
  end

  def destroy
    @booking.destroy
    redirect_to pet_path(@booking.pet)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
