class InstructorLocationsController < ApplicationController
  def destroy
    @location = InstructorLocation.find(params[:id])
    @location.destroy
    redirect_to edit_instructor_path(@location.instructor)
  end
end
