class AwsCertificatesController < ApplicationController
  before_action :set_aws_certificate, only: [:show, :edit, :update, :destroy]

  # GET /aws_certificates
  # GET /aws_certificates.json
  def index
    @aws_certificates = AwsCertificate.all
  end

  # GET /aws_certificates/1
  # GET /aws_certificates/1.json
  def show
  end

  # GET /aws_certificates/new
  def new
    @aws_certificate = AwsCertificate.new
  end

  # GET /aws_certificates/1/edit
  def edit
  end

  # POST /aws_certificates
  # POST /aws_certificates.json
  def create
    @aws_certificate = AwsCertificate.new(aws_certificate_params)

    respond_to do |format|
      if @aws_certificate.save
        format.html { redirect_to @aws_certificate, notice: 'Aws certificate was successfully created.' }
        format.json { render :show, status: :created, location: @aws_certificate }
      else
        format.html { render :new }
        format.json { render json: @aws_certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_certificates/1
  # PATCH/PUT /aws_certificates/1.json
  def update
    respond_to do |format|
      if @aws_certificate.update(aws_certificate_params)
        format.html { redirect_to @aws_certificate, notice: 'Aws certificate was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_certificate }
      else
        format.html { render :edit }
        format.json { render json: @aws_certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_certificates/1
  # DELETE /aws_certificates/1.json
  def destroy
    @aws_certificate.destroy
    respond_to do |format|
      format.html { redirect_to aws_certificates_url, notice: 'Aws certificate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_certificate
      @aws_certificate = AwsCertificate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_certificate_params
      params.require(:aws_certificate).permit(:USER_NO, :PLATFORM_NO, :AWS_ACCESS_ID, :AWS_SECRET_KEY, :DEF_KEYPAIR, :DEF_SUBNET, :DEF_LB_SUBNET)
    end
end
