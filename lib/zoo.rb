class Zoo
  attr_reader :employees
  attr_accessor :cages

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    10.times { @cages << Cage.new }
    # @cages = Array.new(10, Cage.new) # Creates identical objects
    @employees = []
  end

  def add_employee(employee)
    employees << employee
  end

  def open?(date)
    @season_opening_date < date && date < @season_closing_date
  end

  def add_animal(animal)
    added = false

    cages.each do |cage|
      # binding.pry
      if cage.empty? && !added
        cage.animal = animal
        added = true
      end
    end

    if !added
      raise ZooAtCapacity, "zoo at capacity"
    end
  end

  def visit
    result = ""
    @employees.each do |employee|
      result += "#{employee.greet}\n"
    end

    @cages.each do |cage|
      # result += "#{cage.animal.speak}\n" if !cage.empty?
      result += "#{cage.animal.speak}\n" unless cage.empty?

    end
    result
  end
end

class ZooAtCapacity < NameError
end
