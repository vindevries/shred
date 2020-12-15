class InstructorLocationsController < ApplicationController
  def destroy
    @location = InstructorLocation.find(params[:id])
    authorize @location
    @location.destroy
    redirect_to edit_instructor_path(@location.instructor)
  end
end
