require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  if params.empty?
    erb(:square)
  elsif
    @number = params.fetch("number").to_f
    @output = @number ** 2
    erb(:square_output)
  end
end

get("/square_root/new") do
  if params.empty?
    erb(:square_root)
  elsif
    @number = params.fetch("user_number").to_f
    @output = @number ** 0.5
    erb(:square_root_output)
  end
end

get("/payment/new") do
  if params.empty?
    erb(:payment)
  elsif
    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_f
    @principal = params.fetch("user_pv").to_f

    months = @years * 12
    monthly_rate = @apr / 100 / 12

    @numerator = monthly_rate * @principal
    @denominator = 1 - (1 + monthly_rate) ** (-months)

    @payment = @numerator / @denominator
    @payment = @payment.to_fs(:currency)
    @apr = @apr.to_fs(:percentage)
    @principal = @principal.to_fs(:currency)

    erb(:payment_output)
  end
end

get("/random/new") do
end
