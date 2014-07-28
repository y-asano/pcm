class AwsPlatformsController < ApplicationController
  before_action :set_aws_platform, only: [:show, :edit, :update, :destroy]

  # GET /aws_platforms
  # GET /aws_platforms.json
  def index
    @aws_platforms = AwsPlatform.all
  end

  # GET /aws_platforms/1
  # GET /aws_platforms/1.json
  def show
  end

  # GET /aws_platforms/new
  def new
    @aws_platform = AwsPlatform.new
  end

  # GET /aws_platforms/1/edit
  def edit
  end

  # POST /aws_platforms
  # POST /aws_platforms.json
  def create
    @aws_platform = AwsPlatform.new(aws_platform_params)

    respond_to do |format|
      if @aws_platform.save
        format.html { redirect_to @aws_platform, notice: 'Aws platform was successfully created.' }
        format.json { render :show, status: :created, location: @aws_platform }
      else
        format.html { render :new }
        format.json { render json: @aws_platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_platforms/1
  # PATCH/PUT /aws_platforms/1.json
  def update
    respond_to do |format|
      if @aws_platform.update(aws_platform_params)
        format.html { redirect_to @aws_platform, notice: 'Aws platform was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_platform }
      else
        format.html { render :edit }
        format.json { render json: @aws_platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_platforms/1
  # DELETE /aws_platforms/1.json
  def destroy
    @aws_platform.destroy
    respond_to do |format|
      format.html { redirect_to aws_platforms_url, notice: 'Aws platform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_platform
      @aws_platform = AwsPlatform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_platform_params
      params.require(:aws_platform).permit(:PLATFORM_NO, :HOST, :PORT, :SECURE, :EUCA, :VPC, :REGION, :AVAILABILITY_ZONE, :VPC_ID)
    end
end
