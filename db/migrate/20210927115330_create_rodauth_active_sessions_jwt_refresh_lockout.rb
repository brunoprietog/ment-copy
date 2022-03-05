class CreateRodauthActiveSessionsJwtRefreshLockout < ActiveRecord::Migration[7.0]
  def change
    # Used by the active sessions feature
    create_table :account_active_session_keys, primary_key: %i[account_id session_id] do |t|
      t.references :account, foreign_key: true, type: :uuid
      t.string :session_id
      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :last_use, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    # Used by the jwt refresh feature
    create_table :account_jwt_refresh_keys, id: :uuid do |t|
      t.references :account, foreign_key: true, null: false, type: :uuid
      t.string :key, null: false
      t.datetime :deadline, null: false
      t.index :account_id, name: 'account_jwt_rk_account_id_idx'
    end

    # Used by the lockout feature
    create_table :account_login_failures, id: :uuid do |t|
      t.foreign_key :accounts, column: :id
      t.integer :number, null: false, default: 1
    end
    create_table :account_lockouts, id: :uuid do |t|
      t.foreign_key :accounts, column: :id
      t.string :key, null: false
      t.datetime :deadline, null: false
      t.datetime :email_last_sent
    end
  end
end
