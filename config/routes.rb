Quotable::Application.routes.draw do


#***** USER ******#
  devise_for :users

  #********** Static Pages ************#
  root :to => "static_pages#homepage"

  get '/payroll_history' => 'static_pages#payroll_history_test'


  #********** OAuth Login *************#
  get '/auth/:provider/callback' => 'user#oauth_create'

  #********** User Settings *************#

  #********** Load Settings Page ********#
  get '/u/:user_name/settings' => 'user#user_setting_page'
  put '/u/:user_name/settings/notification_settings' => 'user#notification_settings_update', as: 'notification_settings_update'

  #********** User Home Page ********#
  get 'u/:username' => 'user_page#user_home_page', as: 'user_homepage'

  #********** Quotes ********#
  get 'q/:quote_slug' => 'quotes#quote_page', as: 'quote_individual'  
  get 'discover' => 'quotes#discover_page', as: 'discover_page'  


  #********** Author ********#
  get 'a/:author_slug' => 'authors#author_page', as: 'author_page'
  get 'a/' => 'authors#all_authors', as: 'all_authors_home'

  #********** Tags ********#
  get 't/:tag' => 'tags#tag_page', as: 'tag_page'  
  get 't/' => 'tags#all_tags', as: 'all_tags_home'  

  #********** Votes ********#
  post 'votes/add_votes' => 'votes#add_vote', as: 'add_vote'  


end