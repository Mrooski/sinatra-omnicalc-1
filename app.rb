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
