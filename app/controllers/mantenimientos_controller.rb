class MantenimientosController < ApplicationController
  before_action :set_mantenimiento, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action only: [:destroy] do
    authorize_request(["admin"])
  end

  # GET /mantenimientos or /mantenimientos.json
  def index
    @mantenimientos = Mantenimiento.paginate(:page => params[:page], :per_page => 9)
  end

  # GET /mantenimientos/1 or /mantenimientos/1.json
  def show
  end

  # GET /mantenimientos/new
  def new
    @motors = Motor.all
    @mantenimiento = Mantenimiento.new
  end

  # GET /mantenimientos/1/edit
  def edit
    @motors = Motor.all
  end

  # POST /mantenimientos or /mantenimientos.json
  def create
    @motors = Motor.all
    motor_name = params[:mantenimiento][:motor_name]
    motor = Motor.find_by(name: motor_name)

    @mantenimiento = Mantenimiento.new(mantenimiento_params)
    @mantenimiento.motor = motor
    @mantenimiento.type_motor = motor.type_motor
    @mantenimiento.user = current_user
    @mantenimiento.user_email = current_user.email
    @mantenimiento.date_mantenimiento = Date.today

    respond_to do |format|
      if @mantenimiento.save
        format.html { redirect_to mantenimiento_url(@mantenimiento), notice: "Mantenimiento was successfully created." }
        format.json { render :show, status: :created, location: @mantenimiento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mantenimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mantenimientos/1 or /mantenimientos/1.json
  def update
    @motors = Motor.all
    motor_name = params[:mantenimiento][:motor_name]
    motor = Motor.find_by(name: motor_name)

    @mantenimiento.motor = motor
    @mantenimiento.type_motor = motor.type_motor

    respond_to do |format|
      if @mantenimiento.update(mantenimiento_params)
        format.html { redirect_to mantenimiento_url(@mantenimiento), notice: "Mantenimiento was successfully updated." }
        format.json { render :show, status: :ok, location: @mantenimiento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mantenimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mantenimientos/1 or /mantenimientos/1.json
  def destroy
    @mantenimiento.destroy

    respond_to do |format|
      format.html { redirect_to mantenimientos_url, notice: "Mantenimiento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mantenimiento
      @mantenimiento = Mantenimiento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mantenimiento_params
      params.require(:mantenimiento).permit(:type_motor, :type_mantenimiento, :motor_name, :city, :material, :date_mantenimiento, :user_email, :user_id, :motor_id)
    end
end
