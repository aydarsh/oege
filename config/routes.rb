# -*- encoding : utf-8 -*-
Oege::Application.routes.draw do
  root :to => 'math_tests#index' 
  resources :math_tests
  mathjax 'mathjax'
end
