# Be sure to restart your server when you modify this file.

#Spigame::Application.config.session_store :cookie_store, key: '_spigame_session'
Spigame::Application.config.session_store :active_record_store
Spigame::Application.config.session = {
  :key => '_spigame_session',
  :httponly => true
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Spigame::Application.config.session_store :active_record_store
