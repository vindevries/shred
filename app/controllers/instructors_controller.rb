class InstructorsController < ApplicationController
  before_action :set_instructor, only: %i[show edit update destroy]
  # skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @instructors = Instructor.all
  end

  def show
  end

  def new
    @user = current_user
    @instructor = Instructor.new
  end

  def create

    @instructor = Instructor.new(instructor_params)
    @instructor.user = current_user
    # authorize @instructor
    if @instructor.save
      params[:instructor][:languages].each do |language_id|
        InstructorLanguage.create(language_id: language_id, instructor: @instructor)
      end
      params[:instructor][:locations].each do |location_id|
        InstructorLocation.create(location_id: location_id, instructor: @instructor)
      end
      params[:instructor][:packages].each do |package_id|
        InstructorPackage.create(package_id: package_id, instructor: @instructor)
      end
      redirect_to instructor_packages_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @instructor.update(instructor_params)
      redirect_to instructor_path(@instructor)
    else
      render :new
    end
  end

  private

  def set_instructor
    @instructor = current_user.instructor
  end

  def instructor_params
    params.require(:instructor).permit(:description, :gender, :phone, photos: [])
  end
end
