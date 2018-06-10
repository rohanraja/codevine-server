class ValueHoldersController < ApplicationController
  before_action :set_value_holder, only: [:show, :edit, :update, :destroy]

  # GET /value_holders
  # GET /value_holders.json
  def index
    @value_holders = ValueHolder.all
  end

  # GET /value_holders/1
  # GET /value_holders/1.json
  def show
  end

  # GET /value_holders/new
  def new
    @value_holder = ValueHolder.new
  end

  # GET /value_holders/1/edit
  def edit
  end

  # POST /value_holders
  # POST /value_holders.json
  def create
    @value_holder = ValueHolder.new(value_holder_params)

    respond_to do |format|
      if @value_holder.save
        format.html { redirect_to @value_holder, notice: 'Value holder was successfully created.' }
        format.json { render :show, status: :created, location: @value_holder }
      else
        format.html { render :new }
        format.json { render json: @value_holder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /value_holders/1
  # PATCH/PUT /value_holders/1.json
  def update
    respond_to do |format|
      if @value_holder.update(value_holder_params)
        format.html { redirect_to @value_holder, notice: 'Value holder was successfully updated.' }
        format.json { render :show, status: :ok, location: @value_holder }
      else
        format.html { render :edit }
        format.json { render json: @value_holder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /value_holders/1
  # DELETE /value_holders/1.json
  def destroy
    @value_holder.destroy
    respond_to do |format|
      format.html { redirect_to value_holders_url, notice: 'Value holder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value_holder
      @value_holder = ValueHolder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def value_holder_params
      params.require(:value_holder).permit(:rawValue, :timeStamp)
    end
end
