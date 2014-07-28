class AwsImagesController < ApplicationController
  before_action :set_aws_image, only: [:show, :edit, :update, :destroy]

  # GET /aws_images
  # GET /aws_images.json
  def index
    @aws_images = AwsImage.all
  end

  # GET /aws_images/1
  # GET /aws_images/1.json
  def show
  end

  # GET /aws_images/new
  def new
    @aws_image = AwsImage.new
  end

  # GET /aws_images/1/edit
  def edit
  end

  # POST /aws_images
  # POST /aws_images.json
  def create
    @aws_image = AwsImage.new(aws_image_params)

    respond_to do |format|
      if @aws_image.save
        format.html { redirect_to @aws_image, notice: 'Aws image was successfully created.' }
        format.json { render :show, status: :created, location: @aws_image }
      else
        format.html { render :new }
        format.json { render json: @aws_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_images/1
  # PATCH/PUT /aws_images/1.json
  def update
    respond_to do |format|
      if @aws_image.update(aws_image_params)
        format.html { redirect_to @aws_image, notice: 'Aws image was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_image }
      else
        format.html { render :edit }
        format.json { render json: @aws_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_images/1
  # DELETE /aws_images/1.json
  def destroy
    @aws_image.destroy
    respond_to do |format|
      format.html { redirect_to aws_images_url, notice: 'Aws image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_image
      @aws_image = AwsImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_image_params
      params.require(:aws_image).permit(:IMAGE_NO, :IMAGE_ID, :KERNEL_ID, :RAMDISK_ID, :INSTANCE_TYPES, :EBS_IMAGE)
    end
end
