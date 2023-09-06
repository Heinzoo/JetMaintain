require "application_system_test_case"

class MantenimientosTest < ApplicationSystemTestCase
  setup do
    @mantenimiento = mantenimientos(:one)
  end

  test "visiting the index" do
    visit mantenimientos_url
    assert_selector "h1", text: "Mantenimientos"
  end

  test "should create mantenimiento" do
    visit mantenimientos_url
    click_on "New mantenimiento"

    fill_in "City", with: @mantenimiento.city
    fill_in "Date mantenimiento", with: @mantenimiento.date_mantenimiento
    fill_in "Material", with: @mantenimiento.material
    fill_in "Motor", with: @mantenimiento.motor_id
    fill_in "Motor name", with: @mantenimiento.motor_name
    fill_in "Type mantenimiento", with: @mantenimiento.type_mantenimiento
    fill_in "Type motor", with: @mantenimiento.type_motor
    fill_in "User email", with: @mantenimiento.user_email
    fill_in "User", with: @mantenimiento.user_id
    click_on "Create Mantenimiento"

    assert_text "Mantenimiento was successfully created"
    click_on "Back"
  end

  test "should update Mantenimiento" do
    visit mantenimiento_url(@mantenimiento)
    click_on "Edit this mantenimiento", match: :first

    fill_in "City", with: @mantenimiento.city
    fill_in "Date mantenimiento", with: @mantenimiento.date_mantenimiento
    fill_in "Material", with: @mantenimiento.material
    fill_in "Motor", with: @mantenimiento.motor_id
    fill_in "Motor name", with: @mantenimiento.motor_name
    fill_in "Type mantenimiento", with: @mantenimiento.type_mantenimiento
    fill_in "Type motor", with: @mantenimiento.type_motor
    fill_in "User email", with: @mantenimiento.user_email
    fill_in "User", with: @mantenimiento.user_id
    click_on "Update Mantenimiento"

    assert_text "Mantenimiento was successfully updated"
    click_on "Back"
  end

  test "should destroy Mantenimiento" do
    visit mantenimiento_url(@mantenimiento)
    click_on "Destroy this mantenimiento", match: :first

    assert_text "Mantenimiento was successfully destroyed"
  end
end
