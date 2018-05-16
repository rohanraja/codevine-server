class LineRunsController < ApplicationController
  before_action :set_line_run, only: [:show, :edit, :update, :destroy]

  # GET /line_runs
  # GET /line_runs.json
  def index
    @line_runs = LineRun.all
  end

  # GET /line_runs/1
  # GET /line_runs/1.json
  def show
  end

  # GET /line_runs/new
  def new
    @line_run = LineRun.new
  end

  # GET /line_runs/1/edit
  def edit
  end

  # POST /line_runs
  # POST /line_runs.json
  def create
    @line_run = LineRun.new(line_run_params)

    respond_to do |format|
      if @line_run.save
        format.html { redirect_to @line_run, notice: 'Line run was successfully created.' }
        format.json { render :show, status: :created, location: @line_run }
      else
        format.html { render :new }
        format.json { render json: @line_run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_runs/1
  # PATCH/PUT /line_runs/1.json
  def update
    respond_to do |format|
      if @line_run.update(line_run_params)
        format.html { redirect_to @line_run, notice: 'Line run was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_run }
      else
        format.html { render :edit }
        format.json { render json: @line_run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_runs/1
  # DELETE /line_runs/1.json
  def destroy
    @line_run.destroy
    respond_to do |format|
      format.html { redirect_to line_runs_url, notice: 'Line run was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_run
      @line_run = LineRun.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_run_params
      params.require(:line_run).permit(:lineNo, :timeStamp, :method_run_id)
    end
end
