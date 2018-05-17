class MethodRunsController < ApplicationController
  before_action :set_method_run, only: [:show, :edit, :update, :destroy]

  # GET /method_runs
  # GET /method_runs.json
  def index
    @method_runs = MethodRun.all
  end

  # GET /method_runs/1
  # GET /method_runs/1.json
  def show
  end

  # GET /method_runs/new
  def new
    @method_run = MethodRun.new
  end

  # GET /method_runs/1/edit
  def edit
  end

  # POST /method_runs
  # POST /method_runs.json
  def create
    @method_run = MethodRun.new(method_run_params)

    respond_to do |format|
      if @method_run.save
        format.html { redirect_to @method_run, notice: 'Method run was successfully created.' }
        format.json { render :show, status: :created, location: @method_run }
      else
        format.html { render :new }
        format.json { render json: @method_run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /method_runs/1
  # PATCH/PUT /method_runs/1.json
  def update
    respond_to do |format|
      if @method_run.update(method_run_params)
        format.html { redirect_to @method_run, notice: 'Method run was successfully updated.' }
        format.json { render :show, status: :ok, location: @method_run }
      else
        format.html { render :edit }
        format.json { render json: @method_run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /method_runs/1
  # DELETE /method_runs/1.json
  def destroy
    @method_run.destroy
    respond_to do |format|
      format.html { redirect_to method_runs_url, notice: 'Method run was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_method_run
      @method_run = MethodRun.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def method_run_params
      params.require(:method_run).permit(:mrid, :relativeFilePath, :methodName)
    end
end
