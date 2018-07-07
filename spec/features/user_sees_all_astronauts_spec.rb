require 'rails_helper'

describe 'user visits /astronauts' do
  it 'user sees a list of all astronuats along with their name, age, and job' do
    astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
    astronaut_2 = Astronaut.create(name: 'Buzz Aldrin', age: 42, job: 'Pilot')

    visit astronauts_path

    expect(page).to have_content(astronaut_1.name)
    expect(page).to have_content("Age: #{astronaut_1.age}")
    expect(page).to have_content("Job: #{astronaut_1.job}")
    expect(page).to have_content(astronaut_2.name)
    expect(page).to have_content("Age: #{astronaut_2.age}")
    expect(page).to have_content("Job: #{astronaut_2.job}")
  end

  it 'user sees the average age of all astronuats' do
    astronuat_1 = Astronaut.create(name: 'Neil Armstrong', age: 20, job: 'Commander')
    astronaut_2 = Astronaut.create(name: 'Buzz Aldrin', age: 30, job: 'Pilot')
    astronaut_2 = Astronaut.create(name: 'Joe Johnson', age: 40, job: 'Janitor')

    visit astronauts_path

    expect(page).to have_content("Average Age: 30")
  end

  it 'user sees a list of of the space missions in alphabetical order for each restaruant' do
    astronaut = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
    space_mission_1 = astronaut.space_missions.create(title: 'Apollo 13', trip_length: 12)
    space_mission_2 = astronaut.space_missions.create(title: 'Capricorn 4', trip_length: 13)
    space_mission_3 = astronaut.space_missions.create(title: 'Gemini 7', trip_length: 14)

    visit astronauts_path

    expect(page).to have_content("#{space_mission_1.title}")
    expect(page).to have_content("#{space_mission_2.title}")
    expect(page).to have_content("#{space_mission_3.title}")
  end

  it 'user sees total time in space for each astronaut' do
    astronaut = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
    space_mission_1 = astronaut.space_missions.create(title: 'Apollo 13', trip_length: 12)
    space_mission_2 = astronaut.space_missions.create(title: 'Capricorn 4', trip_length: 13)

    visit astronauts_path

    expect(page).to have_content("Total Time in Space: 25 days")
  end
end
