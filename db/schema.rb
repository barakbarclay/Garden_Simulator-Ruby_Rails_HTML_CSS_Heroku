# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20190407214011) do

  create_table "plants", force: :cascade do |t|
    t.string   "name"
    t.integer  "minWater"
    t.integer  "maxWater"
    t.text     "description"
    t.integer  "cost"
    t.integer  "harvestTime"
    t.integer  "harvestGold"
    t.integer  "secondsWaterTakesToDecreaseOneLevel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plots", force: :cascade do |t|
    t.string   "plantName"
    t.string   "category"
    t.string   "buttonBGColor"
    t.string   "readyToHarvest"
    t.integer  "water"
    t.integer  "maxWater"
    t.integer  "minWater"
    t.integer  "secondsWaterTakesToDecreaseOneLevel"
    t.float    "timeSinceLastWaterLevelDecrease"
    t.float    "timePlanted"
    t.integer  "timeNeededBeforeHarvest"
    t.integer  "harvestTime"
    t.integer  "harvestGold"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.integer  "gold"
    t.integer  "currentPlotSelected"
    t.integer  "currentPlantSelected"
    t.boolean  "isPlanting"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
