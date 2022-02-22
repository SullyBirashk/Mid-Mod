require 'rails_helper'

RSpec.describe 'Movies Show Page' do
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

  it "Shows movie info and actors from youngest to oldest" do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)

    expect(page).to have_content(@eggsy.name)
    expect(page).to have_content(@merlin.name)
    expect(page).to have_content(@harry.name)
  end

  it "lists actor from youngest to oldest and has average age of all actors" do
    visit "/movies/#{@movie_1.id}"

    expect(@eggsy.name).to appear_before(@merlin.name)
    expect(@merlin.name).to appear_before(@harry.name)
    expect(@harry.name).to_not appear_before(@eggsy.name)

    expect(page).to have_content(39.67)
  end

  it "Can add an actor to a movie" do
    visit "/movies/#{@movie_1.id}"

    expect(page).to_not have_content(@iron_man.name)

    expect(page).to have_content("Add Actor to Kingsman:")

    fill_in("Name", with: "Edward Holocroft")
    fill_in("Age", with: 34)
    click_button("Submit")

    expect(current_path).to eq("/movies/#{@movie_1.id}")

    expect(page).to have_content("Edward Holocroft")
    expect(page).to have_content(34)
  end
end
