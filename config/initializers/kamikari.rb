# config/initializers/kaminari.rb
#para evitar conflito com will paginate - e active admin (kamikari pagination )
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end