require 'sinatra'

before do
  content_type :txt
  @defeat = {rock: :scissorcs, paper: :rock, scissorcs: :paper}
  @throws = @defeat.keys
end

get '/throw/:type' do
  player_throw = params[:type].to_sym
  if !@throws.include?(player_throw)
    halt 403, "You must throw one of the following: #{@throws}"
  end
end
