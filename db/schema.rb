# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_21_183605) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_comment", id: :bigint, default: nil, force: :cascade do |t|
    t.text "content", null: false
    t.bigint "tweet_id", null: false
    t.integer "user_id", null: false
    t.index ["tweet_id"], name: "api_comment_tweet_id_32f9fdce"
    t.index ["user_id"], name: "api_comment_user_id_14315666"
  end

  create_table "api_like", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.integer "user_id", null: false
    t.index ["tweet_id"], name: "api_like_tweet_id_9e13ddcb"
    t.index ["user_id"], name: "api_like_user_id_cf2ea3c1"
  end

  create_table "api_tweet", id: :bigint, default: nil, force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.text "content", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "api_tweet_user_id_35080c45"
  end

  create_table "auth_group", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.index ["name"], name: "auth_group_name_a6ea08ec_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "auth_group_name_key", unique: true
  end

  create_table "auth_group_permissions", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_0cd325b0_uniq", unique: true
    t.index ["group_id"], name: "auth_group_permissions_group_id_b120cbf9"
    t.index ["permission_id"], name: "auth_group_permissions_permission_id_84c5c92e"
  end

  create_table "auth_permission", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_01ab375a_uniq", unique: true
    t.index ["content_type_id"], name: "auth_permission_content_type_id_2f476e4b"
  end

  create_table "auth_user", id: :integer, default: nil, force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.timestamptz "last_login"
    t.boolean "is_superuser", null: false
    t.string "username", limit: 150, null: false
    t.string "first_name", limit: 150, null: false
    t.string "last_name", limit: 150, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.timestamptz "date_joined", null: false
    t.index ["username"], name: "auth_user_username_6821ab7c_like", opclass: :varchar_pattern_ops
    t.index ["username"], name: "auth_user_username_key", unique: true
  end

  create_table "auth_user_groups", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "auth_user_groups_group_id_97559544"
    t.index ["user_id", "group_id"], name: "auth_user_groups_user_id_group_id_94350c0c_uniq", unique: true
    t.index ["user_id"], name: "auth_user_groups_user_id_6a12ed8b"
  end

  create_table "auth_user_user_permissions", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "auth_user_user_permissions_permission_id_1fbb5f2c"
    t.index ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq", unique: true
    t.index ["user_id"], name: "auth_user_user_permissions_user_id_a95ead1b"
  end

  create_table "django_admin_log", id: :integer, default: nil, force: :cascade do |t|
    t.timestamptz "action_time", null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.integer "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id_c4bce8eb"
    t.index ["user_id"], name: "django_admin_log_user_id_c564eba6"
    t.check_constraint "action_flag >= 0", name: "django_admin_log_action_flag_check"
  end

  create_table "django_content_type", id: :integer, default: nil, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_model_76bd3d3b_uniq", unique: true
  end

  create_table "django_migrations", id: :bigint, default: nil, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.timestamptz "applied", null: false
  end

  create_table "django_session", primary_key: "session_key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.text "session_data", null: false
    t.timestamptz "expire_date", null: false
    t.index ["expire_date"], name: "django_session_expire_date_a5c62663"
    t.index ["session_key"], name: "django_session_session_key_c0390e0f_like", opclass: :varchar_pattern_ops
  end

  create_table "follows", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "followee_id", null: false
    t.integer "follower_id", null: false
    t.index ["followee_id"], name: "follows_followee_id_6accedd4"
    t.index ["follower_id"], name: "follows_follower_id_63fa6a23"
  end

  add_foreign_key "api_comment", "api_tweet", column: "tweet_id", name: "api_comment_tweet_id_32f9fdce_fk_api_tweet_id", deferrable: :deferred
  add_foreign_key "api_comment", "auth_user", column: "user_id", name: "api_comment_user_id_14315666_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "api_like", "api_tweet", column: "tweet_id", name: "api_like_tweet_id_9e13ddcb_fk_api_tweet_id", deferrable: :deferred
  add_foreign_key "api_like", "auth_user", column: "user_id", name: "api_like_user_id_cf2ea3c1_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "api_tweet", "auth_user", column: "user_id", name: "api_tweet_user_id_35080c45_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm", deferrable: :deferred
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permission_content_type_id_2f476e4b_fk_django_co", deferrable: :deferred
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_97559544_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm", deferrable: :deferred
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_c4bce8eb_fk_django_co", deferrable: :deferred
  add_foreign_key "follows", "auth_user", column: "followee_id", name: "follows_followee_id_6accedd4_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "follows", "auth_user", column: "follower_id", name: "follows_follower_id_63fa6a23_fk_auth_user_id", deferrable: :deferred
end
