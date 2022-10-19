class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]
  before_action :authenticate_user!

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  # GET /bookings/1 or /bookings/1.json
  def show; end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(check_in: params[:check_in], check_out: params[:check_out],
                           property_id: params[:property_id])
    @booking.user_id = current_user.id

    respond_to do |format|
      if @booking.save
        format.html { redirect_to property_bookings_path, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to property_bookings_path, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :property_id)
  end
end
