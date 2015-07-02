json.array!(bets) do |bet|
  json.extract! bet, :id, :name
  json.url bet_url(bet, format: :json)
end
