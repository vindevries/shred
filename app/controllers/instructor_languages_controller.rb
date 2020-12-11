class InstructorLanguagesController < ApplicationController
  def destroy
    @language = InstructorLanguage.find(params[:id])
    @language.destroy
    redirect_to edit_instructor_path(@language.instructor)
  end
end
