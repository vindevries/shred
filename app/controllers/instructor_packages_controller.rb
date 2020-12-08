class InstructorPackagesController < ApplicationController
  def new
    @instructor = Instructor.find(params[:instructor_id])
    @instructor_package = InstructorPackage.new
  end

  # def create
  #   @instructor = Instructor.find(params[:instructor_id])
  #   raise
  #   @package = Package.find(params[:instructor_package][:package])
  #   @tags.each do |tag|
  #     costume_tag = CostumeTag.new
  #     costume_tag.costume = @costume
  #     costume_tag.tag = tag
  #     costume_tag.save
  #   end
  #    redirect_to costumes_path
  #   # redirect_to garden_path(@plant.garden)
  # end

end
