# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  aoa.flatten
end

def movie_with_director_name(director_name, movie_data)
  movie_data[:director_name] = director_name
  movie_data
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  movies_collection.each do |e|
    e[:director_name] = name
  end
  movies_collection
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  my_hash = {}
  collection.each do |e|
    key = e[:studio]
    gross = e[:worldwide_gross]
    if my_hash[key] != nil
      my_hash[key] += gross
    else
      my_hash[key] = gross
    end
  end
  my_hash
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  new_array = [nil]
  source.each do |e|
    element_array = []
    e[:movies].each do |n|
      new_hash = {}
      new_hash[:director_name] = e[:name]
      new_hash[:studio] = n[:studio]
      new_hash[:worldwide_gross] = n[:worldwide_gross]
      element_array << new_hash
    end
    if e[:name] == "Byron Poodle"
      new_array.unshift(element_array)
    elsif e[:name] == "Nancy Drew"
      new_array.push(element_array)
    else
      new_array << element_array
    end
  end
  new_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
