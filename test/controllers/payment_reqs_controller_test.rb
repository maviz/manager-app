require "test_helper"

class PaymentReqsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_req = payment_reqs(:one)
  end

  test "should get index" do
    get payment_reqs_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_req_url
    assert_response :success
  end

  test "should create payment_req" do
    assert_difference("PaymentReq.count") do
      post payment_reqs_url, params: { payment_req: { amount: @payment_req.amount, currency: @payment_req.currency, description: @payment_req.description, status: @payment_req.status, transaction_id: @payment_req.transaction_id } }
    end

    assert_redirected_to payment_req_url(PaymentReq.last)
  end

  test "should show payment_req" do
    get payment_req_url(@payment_req)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_req_url(@payment_req)
    assert_response :success
  end

  test "should update payment_req" do
    patch payment_req_url(@payment_req), params: { payment_req: { amount: @payment_req.amount, currency: @payment_req.currency, description: @payment_req.description, status: @payment_req.status, transaction_id: @payment_req.transaction_id } }
    assert_redirected_to payment_req_url(@payment_req)
  end

  test "should destroy payment_req" do
    assert_difference("PaymentReq.count", -1) do
      delete payment_req_url(@payment_req)
    end

    assert_redirected_to payment_reqs_url
  end
end
