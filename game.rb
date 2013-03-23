require 'sinatra'
require 'pp'

before do
    content_type :txt
    # ct = paper , pt = scissors
    # ct == @defeat[scissors:]
    # @defeat[scissors:] = [:paper,:lizard]
    @defeat = {rock: [:scissors,:lizard], paper: [:rock,:spock], scissors: [:paper,:lizard], lizard: [:paper,:spock], spock: [:scissors,:rock]}
    @throws = @defeat.keys
end

get '/throw/:type' do
  p_throw = params[:type].to_sym

  if !@throws.include?(p_throw)
      halt 403, "You must throw one of these: #{@throws}"
  end
  c_throw = @throws.sample
  pp @defeat

  if p_throw == c_throw
      "Tied with computer. Try again!"
  elsif c_throw == @defeat[p_throw][0] || c_throw == @defeat[p_throw][1]
      "You win, #{p_throw} beats #{c_throw}!"
  else
      "In your face!!! #{c_throw} beats #{p_throw}. Better luck next time!"
  end

end
  

