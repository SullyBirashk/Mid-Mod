require 'rails_helper'

RSpec.describe 'Studio Index Page' do
  before :each do
    @studio_1 = Studio.create!(name: "AMC", location: "Riverside")
    @studio_2 = Studio.create!(name: "Elvise Theaters", location: "Aurora")
    @movie_1 = @studio_1.movies.create!(title: "Kingsman", creation_year: 2022, genre: "Spy-Action")
    @movie_2 = @studio_1.movies.create!(title: "Infinity War", creation_year: 2020, genre: "Action-Thriller")
    @movie_3 = @studio_2.movies.create!(title: "Fast and Furious", creation_year: 2015, genre: "Action-Thriller")
    @movie_4 = @studio_2.movies.create!(title: "Transformers", creation_year: 2016, genre: "Action")
  end

  it "Shows studios info and movies assosiated to that studio" do
    visit "/studios"
    
    expect(page).to have_content(@studio_1.name)
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_2.title)

    expect(page).to have_content(@studio_2.name)
    expect(page).to have_content(@movie_3.title)
    expect(page).to have_content(@movie_4.title)
  end
end
