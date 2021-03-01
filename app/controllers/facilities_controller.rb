class FacilitiesController < ApplicationController
  before_action :set_facility, only: %i[ show edit update destroy ]

  # GET /facilities or /facilities.json
  def index
    @facilities = Facility.all.order(:name)
    @facilities_name_desc = Facility.all.order(name: :desc)
    @facilities_capacity_asc = Facility.all.order(:capacity)
    @facilities_capacity_desc = Facility.all.order(capacity: :desc)
  end

  # GET /facilities/1 or /facilities/1.json
  def show
    @all_upcoming_bookings_by_facility = Booking.includes(:facility, :user).where(facility_id: params[:id]).where("booking_date >= ?", Date.today)
    @bookings_by_facility_date_filtered = Booking.includes(:facility, :user).where(facility_id: params[:id]).where("booking_date >= ?", params[:date].presence || Date.today)
    @available_slots_by_facility_today = Timeslot.all.where("id != ?", Booking.where(facility_id: params[:id]).where("booking_date = ?", Date.today).map(&:timeslot_id).presence || 0)
    @available_slots_by_facility_date_filtered = Timeslot.all.where.not(:id => Booking.where(facility_id: params[:id]).where("booking_date = ?", params[:date].presence || Date.today).map(&:timeslot_id).presence || 0)
  end

  # GET /facilities/new
  def new
    @facility = Facility.new
  end

  # GET /facilities/1/edit
  def edit
  end

  # POST /facilities or /facilities.json
  def create
    @facility = Facility.new(facility_params)

    respond_to do |format|
      if @facility.save
        format.html { redirect_to @facility, notice: "Facility was successfully created." }
        format.json { render :show, status: :created, location: @facility }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facilities/1 or /facilities/1.json
  def update
    respond_to do |format|
      if @facility.update(facility_params)
        format.html { redirect_to @facility, notice: "Facility was successfully updated." }
        format.json { render :show, status: :ok, location: @facility }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilities/1 or /facilities/1.json
  def destroy
    @facility.destroy
    respond_to do |format|
      format.html { redirect_to facilities_url, notice: "Facility was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility
      @facility = Facility.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def facility_params
      params.require(:facility).permit(:name, :capacity, :whiteboard, :conferencing)
    end
end
