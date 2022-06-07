class PaymentReqsController < ApplicationController
  before_action :set_payment_req, only: %i[ show edit update destroy ]

  # GET /payment_reqs or /payment_reqs.json
  def index
    @payment_reqs = PaymentReq.order(created_at: :desc).all
  end

  # GET /payment_reqs/1 or /payment_reqs/1.json
  def show
  end

  # GET /payment_reqs/new
  def new
    @payment_req = PaymentReq.new
  end

  # GET /payment_reqs/1/edit
  def edit
  end

  # POST /payment_reqs or /payment_reqs.json
  def create
    @payment_req = PaymentReq.new(payment_req_params)

    respond_to do |format|
      if @payment_req.save
        format.html { redirect_to payment_req_url(@payment_req), notice: "Payment req was successfully created." }
        format.json { render :show, status: :created, location: @payment_req }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_reqs/1 or /payment_reqs/1.json
  def update
    params = payment_req_params
    params[:status] = payment_req_params[:status].to_i
    respond_to do |format| 
      if @payment_req.update(params)
        format.html { redirect_to payment_req_url(@payment_req), notice: "Payment req was successfully updated." }
        format.json { render :show, status: :ok, location: @payment_req }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_reqs/1 or /payment_reqs/1.json
  def destroy
    @payment_req.destroy

    respond_to do |format|
      format.html { redirect_to payment_reqs_url, notice: "Payment req was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_req
      @payment_req = PaymentReq.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_req_params
      params.require(:payment_req).permit(:status)
    end
end
