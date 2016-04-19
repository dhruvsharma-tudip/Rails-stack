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

ActiveRecord::Schema.define(version: 20_160_407_121_659) do
  create_table 'profiles', force: :cascade do |t|
    t.datetime 'created_at',                     null: false
    t.datetime 'updated_at',                     null: false
    t.integer  'user_id', limit: 4
    t.date     'dob'
    t.integer  'phonenumber',        limit: 4
    t.string   'photoupload',        limit: 255
    t.string   'rentvsbuyvsunknown', limit: 255
    t.integer  'whenlookkingfor',    limit: 4
    t.integer  'noofbeds',           limit: 4
    t.integer  'noofbathrooms',      limit: 4
    t.integer  'budget',             limit: 4
    t.integer  'noofchildren',       limit: 4
    t.integer  'agechild',           limit: 4
    t.string   'decision1',          limit: 255
    t.string   'decision2',          limit: 255
    t.string   'workaddress',        limit: 255
  end

  add_index 'profiles', ['user_id'], name: 'index_profiles_on_user_id', using: :btree

  create_table 'roles', force: :cascade do |t|
    t.string   'name', limit: 255
    t.datetime 'created_at',             null: false
    t.datetime 'updated_at',             null: false
  end

  create_table 'schools', force: :cascade do |t|
    t.string   'SchoolName',       limit: 255
    t.string   'School_Location',  limit: 255
    t.string   'Student_Capacity', limit: 255
    t.string   'Email_Id',         limit: 255
    t.datetime 'created_at',                   null: false
    t.datetime 'updated_at',                   null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string   'first_name',             limit: 255
    t.string   'last_name',              limit: 255
    t.datetime 'created_at',                                      null: false
    t.datetime 'updated_at',                                      null: false
    t.integer  'sign_in_count', limit: 4, default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string   'current_sign_in_ip',     limit: 255
    t.string   'last_sign_in_ip',        limit: 255
    t.string   'confirmation_token',     limit: 255
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string   'email',                  limit: 255, default: '', null: false
    t.string   'encrypted_password',     limit: 255, default: '', null: false
    t.string   'reset_password_token',   limit: 255
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string   'avatar_file_name',       limit: 255
    t.string   'avatar_content_type',    limit: 255
    t.integer  'avatar_file_size',       limit: 4
    t.datetime 'avatar_updated_at'
  end

  add_index 'users', ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true, using: :btree
  add_index 'users', ['email'], name: 'index_users_on_email', unique: true, using: :btree
  add_index 'users', ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree

  create_table 'users_roles', force: :cascade do |t|
    t.datetime 'created_at',           null: false
    t.datetime 'updated_at',           null: false
    t.integer  'role_id',    limit: 4
    t.integer  'user_id',    limit: 4
  end

  add_index 'users_roles', ['role_id'], name: 'index_users_roles_on_role_id', using: :btree
  add_index 'users_roles', ['user_id'], name: 'index_users_roles_on_user_id', using: :btree
end
