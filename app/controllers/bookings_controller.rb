class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /bookings or /bookings.json
  def index
    @bookings = current_user.bookings.where("booking_date >= ?", Date.today)
    @bookings_admin = Booking.includes(:facility, :user, :timeslot).where("booking_date >= ?", Date.today)
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = current_user.bookings.build
    @facilities = Facility.all
    @facility = Facility.find_by(id: params[:id])
    redirect_to facilities_path, notice: "Not Facility with specified id" if @facility.nil?
    @available_slots = Timeslot.all.where("id != ?", Booking.where(facility_id: params[:id]).where("booking_date = ?", params[:date].presence || Date.today).map(&:timeslot_id).presence || 0)

    @bookings_by_facility_date_filtered = Booking.includes(:facility, :user).where(facility_id: params[:id]).where("booking_date >= ?", params[:date].presence || Date.today)
    @available_slots_by_facility_date_filtered = Timeslot.all.where.not(:id => Booking.where(facility_id: params[:id]).where("booking_date = ?", params[:date].presence || Date.today).map(&:timeslot_id).presence || 0)

    #@available_slots_by_facility_date_filtered = Timeslot.all.where("id !=?", Booking.where(facility_id: params[:id]).where("booking_date = ?", params[:date].presence || Date.today).map(&:timeslot_id).presence || 0)
    #@available_slots_by_facility_date_filtered = Timeslot.all.find_by(id: Booking.where(facility_id: params[:id]).where("booking_date = ?", params[:date].presence || Date.today).map(&:timeslot_id).presence || 0)

  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create

    #@booking = Booking.new(booking_params)
    @booking = current_user.bookings.build(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @booking = current_user.bookings.find_by(id: params[:id])
    redirect_to bookings_path, notice: "Not Authorised to edit this booking" if @booking.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:booking_date, :timeslot, :user_id, :facility_id, :timeslot_id)
    end
end
