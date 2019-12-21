require 'directors_database'

# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }

def directors_totals(nds)
  result          = {}
  movie_gross_sum = 0
  director_index  = 0

  while director_index < nds.length
    director_name = nds[director_index][:name] # stores directors name in a variable

    movie_gross_sum = gross_for_director(nds[director_index])

    result[director_name] = movie_gross_sum # Adds directors name and movie_gross to hash

    director_index += 1
    movie_gross_sum = 0 # resets the sum for next iteration
  end
  p result
end

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input
def gross_for_director(director_data)
  total = 0

  # Since the director_data is an array, I use the each method to iterate and add to the total variable
  director_data[:movies].each do |movie|
    total += movie[:worldwide_gross]
  end

  total
end
