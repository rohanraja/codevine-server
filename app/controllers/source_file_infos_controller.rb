class SourceFileInfosController < ApplicationController
  before_action :set_source_file_info, only: [:show, :edit, :update, :destroy]

  # GET /source_file_infos
  # GET /source_file_infos.json
  def index
    @source_file_infos = SourceFileInfo.all
  end

  # GET /source_file_infos/1
  # GET /source_file_infos/1.json
  def show
  end

  # GET /source_file_infos/new
  def new
    @source_file_info = SourceFileInfo.new
  end

  # GET /source_file_infos/1/edit
  def edit
  end

  # POST /source_file_infos
  # POST /source_file_infos.json
  def create
    @source_file_info = SourceFileInfo.new(source_file_info_params)

    respond_to do |format|
      if @source_file_info.save
        format.html { redirect_to @source_file_info, notice: 'Source file info was successfully created.' }
        format.json { render :show, status: :created, location: @source_file_info }
      else
        format.html { render :new }
        format.json { render json: @source_file_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_file_infos/1
  # PATCH/PUT /source_file_infos/1.json
  def update
    respond_to do |format|
      if @source_file_info.update(source_file_info_params)
        format.html { redirect_to @source_file_info, notice: 'Source file info was successfully updated.' }
        format.json { render :show, status: :ok, location: @source_file_info }
      else
        format.html { render :edit }
        format.json { render json: @source_file_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_file_infos/1
  # DELETE /source_file_infos/1.json
  def destroy
    @source_file_info.destroy
    respond_to do |format|
      format.html { redirect_to source_file_infos_url, notice: 'Source file info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_file_info
      @source_file_info = SourceFileInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_file_info_params
      params.require(:source_file_info).permit(:source_code_info_id, :code, :relativePath)
    end
end
