class ParkedVehicalsController < ApplicationController
  before_action :set_parked_vehical, only: [:show, :edit, :update, :destroy, :release]

  # GET /parked_vehicals
  # GET /parked_vehicals.json
  def index
    @parked_vehicals = ParkedVehical.all.order('created_at desc')
  end

  # GET /parked_vehicals/1
  # GET /parked_vehicals/1.json
  def show
  end

  # GET /parked_vehicals/new
  def new
    @parked_vehical = ParkedVehical.new
  end

  # GET /parked_vehicals/1/edit
  def edit
  end

  # POST /parked_vehicals
  # POST /parked_vehicals.json
  def create
    @parked_vehical = ParkedVehical.new(parked_vehical_params)

    respond_to do |format|
      if @parked_vehical.save
        format.html { redirect_to @parked_vehical, notice: 'Parked vehical was successfully created.' }
        format.json { render :show, status: :created, location: @parked_vehical }
      else
        format.html { render :new }
        format.json { render json: @parked_vehical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parked_vehicals/1
  # PATCH/PUT /parked_vehicals/1.json
  def update
    respond_to do |format|
      if @parked_vehical.update(parked_vehical_params)
        format.html { redirect_to @parked_vehical, notice: 'Parked vehical was successfully updated.' }
        format.json { render :show, status: :ok, location: @parked_vehical }
      else
        format.html { render :edit }
        format.json { render json: @parked_vehical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parked_vehicals/1
  # DELETE /parked_vehicals/1.json
  def destroy
    @parked_vehical.destroy
    respond_to do |format|
      format.html { redirect_to parked_vehicals_url, notice: 'Parked vehical was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def release
    @parked_vehical.update_attributes(:parking_end_time => Time.now)
    @parked_vehical.mark_parking_slot_free
    respond_to do |format|
      format.html { redirect_to parking_slots_path, notice: 'Parking released successful.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parked_vehical
      @parked_vehical = ParkedVehical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parked_vehical_params
      params.require(:parked_vehical).permit(:parking_slot_id, :vehical_no_plate, :parking_start_time, :parking_end_time)
    end
end
