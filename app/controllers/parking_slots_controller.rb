class ParkingSlotsController < ApplicationController
  before_action :set_parking_slot, only: [:show, :edit, :update, :destroy]

  # GET /parking_slots
  # GET /parking_slots.json
  def index
    @parking_slots = ParkingSlot.all
  end

  # GET /parking_slots/1
  # GET /parking_slots/1.json
  def show
  end

  # GET /parking_slots/new
  def new
    @parking_slot = ParkingSlot.new
  end

  # GET /parking_slots/1/edit
  def edit
  end

  # POST /parking_slots
  # POST /parking_slots.json
  def create
    @parking_slot = ParkingSlot.new(parking_slot_params)

    respond_to do |format|
      if @parking_slot.save
        format.html { redirect_to @parking_slot, notice: 'Parking slot was successfully created.' }
        format.json { render :show, status: :created, location: @parking_slot }
      else
        format.html { render :new }
        format.json { render json: @parking_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_slots/1
  # PATCH/PUT /parking_slots/1.json
  def update
    respond_to do |format|
      if @parking_slot.update(parking_slot_params)
        format.html { redirect_to @parking_slot, notice: 'Parking slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @parking_slot }
      else
        format.html { render :edit }
        format.json { render json: @parking_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_slots/1
  # DELETE /parking_slots/1.json
  def destroy
    @parking_slot.destroy
    respond_to do |format|
      format.html { redirect_to parking_slots_url, notice: 'Parking slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def allot_parking
    no_plate = "HR26-#{rand.to_s[2..5]}"
    available_slot = ParkingSlot.available_slot.first
    parked_vehical = ParkedVehical.new(vehical_no_plate: no_plate, parking_start_time: Time.now)
    parked_vehical.parking_slot = available_slot
    parked_vehical.save
    parked_vehical.mark_parking_slot_busy
    redirect_to parked_vehicals_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_slot
      @parking_slot = ParkingSlot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_slot_params
      params.require(:parking_slot).permit(:sequence_number, :available, :auto_release_time)
    end
end
