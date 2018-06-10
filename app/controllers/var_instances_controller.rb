class VarInstancesController < ApplicationController
  before_action :set_var_instance, only: [:show, :edit, :update, :destroy]

  # GET /var_instances
  # GET /var_instances.json
  def index
    @var_instances = VarInstance.all
  end

  # GET /var_instances/1
  # GET /var_instances/1.json
  def show
  end

  # GET /var_instances/new
  def new
    @var_instance = VarInstance.new
  end

  # GET /var_instances/1/edit
  def edit
  end

  # POST /var_instances
  # POST /var_instances.json
  def create
    @var_instance = VarInstance.new(var_instance_params)

    respond_to do |format|
      if @var_instance.save
        format.html { redirect_to @var_instance, notice: 'Var instance was successfully created.' }
        format.json { render :show, status: :created, location: @var_instance }
      else
        format.html { render :new }
        format.json { render json: @var_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /var_instances/1
  # PATCH/PUT /var_instances/1.json
  def update
    respond_to do |format|
      if @var_instance.update(var_instance_params)
        format.html { redirect_to @var_instance, notice: 'Var instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @var_instance }
      else
        format.html { render :edit }
        format.json { render json: @var_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /var_instances/1
  # DELETE /var_instances/1.json
  def destroy
    @var_instance.destroy
    respond_to do |format|
      format.html { redirect_to var_instances_url, notice: 'Var instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_var_instance
      @var_instance = VarInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def var_instance_params
      params.require(:var_instance).permit(:name, :type)
    end
end
