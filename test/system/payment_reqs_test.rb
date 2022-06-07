require "application_system_test_case"

class PaymentReqsTest < ApplicationSystemTestCase
  setup do
    @payment_req = payment_reqs(:one)
  end

  test "visiting the index" do
    visit payment_reqs_url
    assert_selector "h1", text: "Payment reqs"
  end

  test "should create payment req" do
    visit payment_reqs_url
    click_on "New payment req"

    fill_in "Amount", with: @payment_req.amount
    fill_in "Currency", with: @payment_req.currency
    fill_in "Description", with: @payment_req.description
    fill_in "Status", with: @payment_req.status
    fill_in "Transaction", with: @payment_req.transaction_id
    click_on "Create Payment req"

    assert_text "Payment req was successfully created"
    click_on "Back"
  end

  test "should update Payment req" do
    visit payment_req_url(@payment_req)
    click_on "Edit this payment req", match: :first

    fill_in "Amount", with: @payment_req.amount
    fill_in "Currency", with: @payment_req.currency
    fill_in "Description", with: @payment_req.description
    fill_in "Status", with: @payment_req.status
    fill_in "Transaction", with: @payment_req.transaction_id
    click_on "Update Payment req"

    assert_text "Payment req was successfully updated"
    click_on "Back"
  end

  test "should destroy Payment req" do
    visit payment_req_url(@payment_req)
    click_on "Destroy this payment req", match: :first

    assert_text "Payment req was successfully destroyed"
  end
end
