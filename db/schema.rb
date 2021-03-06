# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_08_124113) do

  create_table "addresses", force: :cascade do |t|
    t.string "address_type"
    t.string "status"
    t.string "entity"
    t.string "street_number_name"
    t.string "apartment_number"
    t.string "city"
    t.string "state_province"
    t.string "zip_code"
    t.string "country"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "administrators", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batteries", force: :cascade do |t|
    t.integer "building_id"
    t.string "battery_type"
    t.string "status"
    t.integer "employee_id"
    t.date "date_of_commissioning"
    t.date "last_inspection_date"
    t.string "operations_certificate"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_batteries_on_building_id"
  end

  create_table "battery_stocks", force: :cascade do |t|
    t.string "boards"
    t.string "batteries"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "building_details", force: :cascade do |t|
    t.integer "building_id"
    t.string "information_key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "address_id"
    t.string "building_administrator_full_name"
    t.string "building_administrator_email"
    t.string "building_administrator_phone"
    t.string "building_technical_contact_name"
    t.string "building_technical_contact_email"
    t.string "building_technical_contact_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_buildings_on_address_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "careers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "phone"
    t.string "position"
    t.string "expected_salary"
    t.date "start_date"
    t.text "experience"
    t.binary "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "column_stocks", force: :cascade do |t|
    t.string "doors"
    t.string "cables"
    t.string "displays"
    t.string "callbuttons"
    t.string "bearings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "columns", force: :cascade do |t|
    t.integer "battery_id"
    t.string "column_type"
    t.string "floor_number"
    t.string "status"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "address_id"
    t.string "company_name"
    t.string "full_name"
    t.string "phone"
    t.string "email"
    t.string "company_description"
    t.string "full_name_of_service_technical"
    t.string "phone_of_service_technical"
    t.string "email_of_service_technical"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_customers_on_address_id"
  end

  create_table "elevator_stocks", force: :cascade do |t|
    t.string "standard"
    t.string "premium"
    t.string "excelium"
    t.string "doors"
    t.string "displays"
    t.string "buttons"
    t.string "safety_gears"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elevators", force: :cascade do |t|
    t.integer "column_id"
    t.string "serial_number"
    t.string "elevator_class"
    t.string "elevator_type"
    t.string "notes"
    t.string "status"
    t.date "date_of_commissioning"
    t.date "date_of_last_inspection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "full_name"
    t.string "phone"
    t.string "email"
    t.string "SIN"
    t.string "insurer"
    t.string "insurance_type"
    t.integer "vacancy_days_left"
    t.string "YTD_hour"
    t.string "YTD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interventions", force: :cascade do |t|
    t.string "Author"
    t.integer "Customer_id"
    t.integer "Building_id"
    t.integer "Battery_id"
    t.integer "Column_id"
    t.integer "Elevator_id"
    t.integer "Employee_id"
    t.datetime "InterventionStartingDate"
    t.datetime "InterventionFinishedDate"
    t.string "Result"
    t.string "Report"
    t.string "Status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", force: :cascade do |t|
    t.integer "customer_id"
    t.string "full_name"
    t.string "email"
    t.string "phone"
    t.string "business_name"
    t.string "project_name"
    t.string "department"
    t.text "project_description"
    t.text "message"
    t.binary "file_attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_leads_on_customer_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "Full_Name"
    t.string "Phone_Number"
    t.string "Company_Name"
    t.string "Email"
    t.string "Building_Type"
    t.string "Product_Grade"
    t.integer "Nb_Appartement"
    t.integer "Nb_Business"
    t.integer "Nb_Floor"
    t.integer "Nb_Basement"
    t.integer "Nb_Cage"
    t.integer "Nb_Parking"
    t.integer "Nb_OccupantPerFloor"
    t.integer "Nb_OpperatingHour"
    t.string "Final_Price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "subscription"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
