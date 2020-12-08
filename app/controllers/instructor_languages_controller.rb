class InstructorLanguagesController < ApplicationController
  def new
    # @instructor = Instructor.find(params[:instructor_id])
    @instructor_language = InstructorLanguage.new
  end

  def create
   
    # @languages = Language.find(params[:instructor_language][:language])
    
    # params[:instructor_language][:language].each do |language|
    #   instructor_language = InstructorLanguage.new
    #   instructor_language.instructor = current_user
    #   instructor_language.language = language
    #   instructor_language.save
    end


 
    # redirect_to garden_path(@plant.garden)
  end





end
