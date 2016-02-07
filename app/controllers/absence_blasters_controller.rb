class AbsenceBlastersController < ApplicationController
  before_action :set_absence_blaster, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  # GET /absence_blasters
  # GET /absence_blasters.json
  def index
    @absence_blasters = AbsenceBlaster.all
  end

  # GET /absence_blasters/1
  # GET /absence_blasters/1.json
  def show
  end

  # GET /absence_blasters/new
  def new
    @absence_blaster = AbsenceBlaster.new
  end

  # GET /absence_blasters/1/edit
  def edit
  end

  # POST /absence_blasters
  # POST /absence_blasters.json
  def create
    @absence_blaster = AbsenceBlaster.new(absence_blaster_params)

    respond_to do |format|
      if @absence_blaster.save
        format.html { redirect_to @absence_blaster, notice: 'Absence blaster was successfully created.' }
        format.json { render :show, status: :created, location: @absence_blaster }
      else
        format.html { render :new }
        format.json { render json: @absence_blaster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /absence_blasters/1
  # PATCH/PUT /absence_blasters/1.json
  def update
    respond_to do |format|
      if @absence_blaster.update(absence_blaster_params)
        format.html { redirect_to @absence_blaster, notice: 'Absence blaster was successfully updated.' }
        format.json { render :show, status: :ok, location: @absence_blaster }
      else
        format.html { render :edit }
        format.json { render json: @absence_blaster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /absence_blasters/1
  # DELETE /absence_blasters/1.json
  def destroy
    @absence_blaster.destroy
    respond_to do |format|
      format.html { redirect_to absence_blasters_url, notice: 'Absence blaster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_absence_blaster
      @absence_blaster = AbsenceBlaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def absence_blaster_params
      params.require(:absence_blaster).permit(:recipient_name, :recipient_number, :shift, :access_code, :absense_id)
    end
end
