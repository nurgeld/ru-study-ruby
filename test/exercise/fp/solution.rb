module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.select do |row|
          !row['rating_kinopoisk'].nil? &&
            row['rating_kinopoisk'] != '0' &&
            !row['country'].nil? &&
            row['country'].split(',').size >= 2
        end
        films_count = filtered_films.size

        sum_of_ratings = filtered_films.map { |row| row['rating_kinopoisk'].to_f }.reduce(:+)
        sum_of_ratings / films_count
      end

      def chars_count(films, threshold)
        rated_films = films.select do |row|
          !row['rating_kinopoisk'].nil? &&
            row['rating_kinopoisk'].to_f >= threshold
        end
        film_names = rated_films.map { |film| film['name'] }

        film_names.reduce(0) do |count, name|
          count += name.chars.select { |char| char == 'и' }.size
          count
        end
      end
    end
  end
end
