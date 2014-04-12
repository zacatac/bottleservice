json.array!(@drivers) do |driver|
  json.extract! driver, :id, :stock_cheap, :stock_classy, :phone
  json.url driver_url(driver, format: :json)
end
