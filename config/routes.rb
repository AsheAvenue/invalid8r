Invalid8r::Application.routes.draw do
  root :to => 'invalid8#index'
  match ':sitekey' => 'invalid8#handle'
end
