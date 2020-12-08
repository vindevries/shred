class InstructorLanguagesController < ApplicationController
  def new
    @instructor = Instructor.find(params[:instructor_id])
    @instructor_language = InstructorLanguage.new
  end

  def create
    # @instructor = Instructor.find(params[:costume_id])
    # @languages = Language.find(params[:instructor_language][:language])
    # @tags.each do |tag|
    #   costume_tag = InstructorLanguage.new
    #   instructor_language.instructor = @instructor
    #    instructor_language.language = tag
    #   costume_tag.save
    # endInstructor
    #  redirect_to costumes_path



    # redirect_to garden_path(@plant.garden)
  end
end
