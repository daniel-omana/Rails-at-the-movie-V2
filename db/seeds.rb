require 'csv'

Movie.delete_all
ProductionCompany.delete_all

filename = Rails.root.join('db/top_movies.csv')

puts "Loading Movies from csv file: #{filename}"

csv_data = File.read(filename)
movies = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

movies.each do |m|
  production_company = ProductionCompany.find_or_create_by(name: m['production_company'])

  if production_company.valid?
    #  create the movie
    movie = production_company.movies.create(
      title: m['original_title'],
      year: m['year'],
      duration: m['duration'],
      description: m['description'],
      average_vote: m['avg_vote']
    )

    puts "Invalid movie #{m['original_movie']}" unless movie&.valid?
  else
    puts "Invalid production company #{m['production_company']} for movie #{m['original_title']}"
  end
end

puts "Created #{ProductionCompany.count} Production Companies"
puts "Created #{Movie.count} movies"
