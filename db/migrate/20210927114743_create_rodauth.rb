class CreateRodauth < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :email, null: false
      t.string :status, null: false, default: 'unverified'
      t.index :email, unique: true, where: "status IN ('unverified', 'verified')"
    end

    # Used if storing password hashes in a separate table (default)
    create_table :account_password_hashes, id: :uuid do |t|
      t.foreign_key :accounts, column: :id
      t.string :password_hash, null: false
    end

    # Used by the password reset feature
    create_table :account_password_reset_keys, id: :uuid do |t|
      t.foreign_key :accounts, column: :id
      t.string :key, null: false
      t.datetime :deadline, null: false
      t.datetime :email_last_sent, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    # Used by the account verification feature
    create_table :account_verification_keys, id: :uuid do |t|
      t.foreign_key :accounts, column: :id
      t.string :key, null: false
      t.datetime :requested_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :email_last_sent, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    # Used by the verify login change feature
    create_table :account_login_change_keys, id: :uuid do |t|
      t.foreign_key :accounts, column: :id
      t.string :key, null: false
      t.string :login, null: false
      t.datetime :deadline, null: false
    end

    # Used by the remember me feature
    create_table :account_remember_keys, id: :uuid do |t|
      t.foreign_key :accounts, column: :id
      t.string :key, null: false
      t.datetime :deadline, null: false
    end
  end
end