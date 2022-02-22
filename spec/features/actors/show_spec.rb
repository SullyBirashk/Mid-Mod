require 'rails_helper'

RSpec.describe 'Actors Show Page' do
  before :each do
    @studio_1 = Studio.create!(name: "AMC", location: "Riverside")
    @studio_2 = Studio.create!(name: "Elvise Theaters", location: "Aurora")
    @movie_1 = @studio_1.movies.create!(title: "Kingsman", creation_year: 2022, genre: "Spy-Action")
    @eggsy = @movie_1.actors.create!(name: "Taron Egerton", age: 32)
    @harry = @movie_1.actors.create!(name: "Colin Firth", age: 45)
    @merlin = @movie_1.actors.create!(name: "Stanley Tucci", age: 42)
    @movie_2 = @studio_1.movies.create!(title: "Infinity War", creation_year: 2020, genre: "Action-Thriller")
    @iron_man = @movie_2.actors.create!(name: "Robert Downy Jr", age: 33)
    @movie_3 = @studio_2.movies.create!(title: "Fast and Furious", creation_year: 2015, genre: "Action-Thriller")
    @movie_4 = @studio_2.movies.create!(title: "Transformers", creation_year: 2016, genre: "Action")
  end

  it "Shows co-actors Actor has worked with" do
    visit "/actors/#{@eggsy.id}"

    expect(page).to have_content(@eggsy.name)
    expect(page).to have_content(@eggsy.age)

    expect(page).to have_content("Actors Taron Egerton has worked with:")
    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@merlin.name)
  end
end
