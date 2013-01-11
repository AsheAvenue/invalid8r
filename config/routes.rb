Invalid8r::Application.routes.draw do
  root :to => 'invalid8#index'
  match "/invalid8" => 'invalid8#form'
  match ':sitekey' => 'invalid8#handle'
end
