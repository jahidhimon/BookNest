require "application_system_test_case"

class LendingsTest < ApplicationSystemTestCase
  setup do
    @lending = lendings(:one)
  end

  test "visiting the index" do
    visit lendings_url
    assert_selector "h1", text: "Lendings"
  end

  test "should create lending" do
    visit lendings_url
    click_on "New lending"

    fill_in "Book", with: @lending.book_id
    fill_in "Penalty", with: @lending.penalty
    fill_in "Return date", with: @lending.return_date
    fill_in "Returned date", with: @lending.returned_date
    fill_in "User", with: @lending.user_id
    click_on "Create Lending"

    assert_text "Lending was successfully created"
    click_on "Back"
  end

  test "should update Lending" do
    visit lending_url(@lending)
    click_on "Edit this lending", match: :first

    fill_in "Book", with: @lending.book_id
    fill_in "Penalty", with: @lending.penalty
    fill_in "Return date", with: @lending.return_date.to_s
    fill_in "Returned date", with: @lending.returned_date.to_s
    fill_in "User", with: @lending.user_id
    click_on "Update Lending"

    assert_text "Lending was successfully updated"
    click_on "Back"
  end

  test "should destroy Lending" do
    visit lending_url(@lending)
    click_on "Destroy this lending", match: :first

    assert_text "Lending was successfully destroyed"
  end
end
