require 'rubygems'
require 'ramaze'
require "#{File.dirname(__FILE__)}/tuesday"
require "#{File.dirname(__FILE__)}/confirmation"

require 'ramaze/store/default'

class MainController < Ramaze::Controller

  engine :Haml
  
  DB = Ramaze::Store::Default.new("#{File.dirname(__FILE__)}/../data/pizza.yaml")

  def index
    @title = "Welcome to Ruby Tuesdays"
    @content = "Do you want pizza?"
    @next_date = Tuesday.next
  end
  
  def signup
    @pizzas_available = Pizza::PIZZAS
  end

  def coming
    @name = request['name']
    @pizza = request['pizza-type']
 
    @confirmation = Confirmation.new({:name => @name, :choice => @pizza}) 
 
    DB[@confirmation.name] =  @confirmation
    
  end

  def who
    @tuesdays = ['Tuesday 1', 'Tuesday 2']
  end

end
