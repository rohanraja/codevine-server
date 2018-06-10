class ClrClassInstancesController < ApplicationController
  before_action :set_clr_class_instance, only: [:show, :edit, :update, :destroy]

  # GET /clr_class_instances
  # GET /clr_class_instances.json
  def index
    @clr_class_instances = ClrClassInstance.all
  end

  # GET /clr_class_instances/1
  # GET /clr_class_instances/1.json
  def show
  end

  # GET /clr_class_instances/new
  def new
    @clr_class_instance = ClrClassInstance.new
  end

  # GET /clr_class_instances/1/edit
  def edit
  end

  # POST /clr_class_instances
  # POST /clr_class_instances.json
  def create
    @clr_class_instance = ClrClassInstance.new(clr_class_instance_params)

    respond_to do |format|
      if @clr_class_instance.save
        format.html { redirect_to @clr_class_instance, notice: 'Clr class instance was successfully created.' }
        format.json { render :show, status: :created, location: @clr_class_instance }
      else
        format.html { render :new }
        format.json { render json: @clr_class_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clr_class_instances/1
  # PATCH/PUT /clr_class_instances/1.json
  def update
    respond_to do |format|
      if @clr_class_instance.update(clr_class_instance_params)
        format.html { redirect_to @clr_class_instance, notice: 'Clr class instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @clr_class_instance }
      else
        format.html { render :edit }
        format.json { render json: @clr_class_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clr_class_instances/1
  # DELETE /clr_class_instances/1.json
  def destroy
    @clr_class_instance.destroy
    respond_to do |format|
      format.html { redirect_to clr_class_instances_url, notice: 'Clr class instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clr_class_instance
      @clr_class_instance = ClrClassInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clr_class_instance_params
      params.require(:clr_class_instance).permit(:instanceId)
    end
end
