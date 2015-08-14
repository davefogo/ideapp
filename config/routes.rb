Rails.application.routes.draw do
  
  root to: 'visitors#index'
  resources :factura_items
  devise_for :users
  resources :users
  resources :facturas
  resources :departamentos
  resources :clientes
  resources :colaboradores
  resources :cargos
  get 'bienvenidos/index'
  resources :medios
  resources :proveedores
  resources :clases
  resources :grupos
  resources :cuenta_pucs
  resources :subcuenta_pucs
  resources :transaccions
  resources :volumenes
  resources :factura_proveedors
  resources :recibo_de_cajas
  resources :gastos
  resources :pagos
  resources :activo_fijos
  resources :presupuestos do 
    resources :ordenes, controller: 'presupuestos/ordenes'
  end
 

end
