class PlanificationsController < ApplicationController
  before_action :set_planification, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_owner, only: [:update, :destroy]

  # POST /planifications.json
  def create
    @planification = Planification.new(planification_params)
    @planification.user = current_user
    @planification.year = Date.today.year

    respond_to do |format|
      if @planification.save
        format.json { render json: { status: :created } }
      else
        format.json { render json: @planification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planifications/1.json
  def update
    respond_to do |format|
      if @planification.update(planification_params)
        format.json { render json: { status: :updated } }
      else
        format.json { render json: @planification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planifications/1.json
  def destroy
    @planification.destroy
    respond_to do |format|
      format.json { render json: { status: :deleted } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planification
      @planification = Planification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planification_params
      params.require(:planification).permit(:plant_id, :seed_week)
    end

    def check_owner
      redirect_to root_path if @planification.user != current_user
    end
end
