# frozen_string_literal: true
# search json build
json.locations do
  json.array!(@locations) do |loc|
    json.location loc.location
  end
end