class AbsensesController < ApplicationController
  before_action :set_absense, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /absenses
  # GET /absenses.json
  def index
    @absenses = Absense.all
  end

  # GET /absenses/1
  # GET /absenses/1.json
  def show
  end

  # GET /absenses/new
  def new
    @absense = Absense.new
  end

  def update_absense_by_access_code
    @blaster = AbsenceBlaster.find_by_access_code(params[:access_code])
    puts 'PARAMMSSS: ' + params.to_yaml
    #puts 'Blasterrrrrr      ' + @blaster.
    puts @blaster.to_yaml
    puts 'Class is: ' + @blaster.class.to_s
    puts @blaster.absense_id
    @absense = Absense.find(@blaster.absense_id)
    Absense.update(@blaster.absense_id, :replacement_employee => params[:replacement_employee])
    @blaster.delete
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  # GET /absenses/1/edit
  def edit
  end

  # POST /absenses
  # POST /absenses.json
  def create
    @absense = Absense.new(absense_params)

    respond_to do |format|
      if @absense.save
        format.html { redirect_to @absense, notice: 'Absense was successfully created.' }
        format.json { render :show, status: :created, location: @absense }
      else
        format.html { render :new }
        format.json { render json: @absense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /absenses/1
  # PATCH/PUT /absenses/1.json
  def update
    respond_to do |format|
      if @absense.update(absense_params)
        format.html { redirect_to @absense, notice: 'Absense was successfully updated.' }
        format.json { render :show, status: :ok, location: @absense }
      else
        format.html { render :edit }
        format.json { render json: @absense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /absenses/1
  # DELETE /absenses/1.json
  def destroy
    @absense.destroy
    respond_to do |format|
      format.html { redirect_to absenses_url, notice: 'Absense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_absense
      @absense = Absense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def absense_params
      params.require(:absense).permit(:shift, :reason, :replacement_employee, :employee_id, :phone_number)
    end
end
