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
