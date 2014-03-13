Quotable::Application.routes.draw do


#***** USER ******#
  devise_for :users

  #********** Static Pages ************#
  root :to => "static_pages#homepage"

  #********** OAuth Login *************#
  get '/auth/:provider/callback' => 'user#oauth_create'

  #********** User Settings *************#

  #********** Load Settings Page ********#
  get '/u/:user_name/settings' => 'user#user_setting_page'

  put '/u/:user_name/settings/notification_settings' => 'user#notification_settings_update', as: 'notification_settings_update'



end
