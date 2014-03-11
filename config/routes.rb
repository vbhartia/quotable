Quotable::Application.routes.draw do
  devise_for :users

  #********** Static Pages ************#
  root :to => "static_pages#homepage"

end
