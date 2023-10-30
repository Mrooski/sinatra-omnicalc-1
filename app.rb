require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
    erb(:square)
end

get("/square/results") do 
  @number = params.fetch("number").to_f
  @output = @number ** 2
  erb(:square_output)
end

get("/square_root/new") do
    erb(:square_root)
end

get("/square_root/results") do
  @number = params.fetch("user_number").to_f
  @output = @number ** 0.5
  erb(:square_root_output)
end

get("/payment/new") do
  erb(:payment)
end


get ("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_f
  @principal = params.fetch("user_pv").to_f

  months = @years * 12
  monthly_rate = @apr / 100 / 12

  @numerator = monthly_rate * @principal
  @denominator = 1 - (1 + monthly_rate) ** (-months)

  @payment = @numerator / @denominator
  @payment = @payment.to_fs(:currency)
  @apr = @apr.to_fs(:percentage, { :precision => 4})
  @principal = @principal.to_fs(:currency)

  erb(:payment_output)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @max = params.fetch("user_max").to_f
  @min = params.fetch("user_min").to_f

  @result = rand(@min..@max)

  erb(:random_output)
end
