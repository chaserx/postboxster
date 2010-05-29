# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_postbox_session',
  :secret      => 'f4ef978bdd15a994668ad50cbdfc3368efddb297c84b4c03d32dc491a2937dd6c917efd00dac2c9594c34d1cdeee23ec30efd3d076b48fbce42ac9b1d4926256'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
