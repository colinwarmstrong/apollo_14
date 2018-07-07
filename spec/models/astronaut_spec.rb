require 'rails_helper'

describe Astronaut, type: :model do
  describe "class methods" do
    it 'average age' do
      Astronaut.create(name: "Joe", age: 20, job: 'janitor')
      Astronaut.create(name: "Bill", age: 30, job: 'cook')

      expect(Astronaut.average_age).to eq(25)
    end
  end

  describe 'instance methods' do
    it 'total_time_in_space' do
      astronaut = Astronaut.create(name: "Joe", age: 25, job: 'janitor')
      astronaut.space_missions.create(title: 'Capricorn 4', trip_length: 4)
      astronaut.space_missions.create(title: 'Voyager', trip_length: 6)

      expect(astronaut.total_time_in_space).to eq(10)
    end
  end  
end
