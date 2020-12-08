class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
  end
   
  def show
  end
  
  
  def new
    @instructor = Instructor.new
  end
  
  def create
  
  end

end