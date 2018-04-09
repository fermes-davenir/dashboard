class PlanificationsController < ApplicationController
  before_action :set_planification, only: [:show, :edit, :update, :destroy]

  # GET /planifications
  # GET /planifications.json
  def index
    @planifications = Planification.all
  end

  # GET /planifications/1
  # GET /planifications/1.json
  def show
  end

  # GET /planifications/new
  def new
    @planification = Planification.new
  end

  # GET /planifications/1/edit
  def edit
  end

  # POST /planifications
  # POST /planifications.json
  def create
    @planification = Planification.new(planification_params)

    respond_to do |format|
      if @planification.save
        format.html { redirect_to @planification, notice: 'Planification was successfully created.' }
        format.json { render :show, status: :created, location: @planification }
      else
        format.html { render :new }
        format.json { render json: @planification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planifications/1
  # PATCH/PUT /planifications/1.json
  def update
    respond_to do |format|
      if @planification.update(planification_params)
        format.html { redirect_to @planification, notice: 'Planification was successfully updated.' }
        format.json { render :show, status: :ok, location: @planification }
      else
        format.html { render :edit }
        format.json { render json: @planification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planifications/1
  # DELETE /planifications/1.json
  def destroy
    @planification.destroy
    respond_to do |format|
      format.html { redirect_to planifications_url, notice: 'Planification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planification
      @planification = Planification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planification_params
      params.require(:planification).permit(:year, :user_id, :possibility_id)
    end
end
