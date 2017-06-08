# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_workspace_session'

#Rails.application.config.session_store :redis_store, {
#  servers: [
#    {
#      host: "localhost",
#      port: 6379,
#      db: 0,
#      password: "mysecret",
#      namespace: "session"
#    },
#  ],
#  expire_after: 10.minutes
#}