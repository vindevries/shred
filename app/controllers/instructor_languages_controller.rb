class InstructorLanguagesController < ApplicationController
  def destroy
    @language = InstructorLanguage.find(params[:id])
    authorize @language
    @language.destroy
    redirect_to edit_instructor_path(@language.instructor)
  end
end
