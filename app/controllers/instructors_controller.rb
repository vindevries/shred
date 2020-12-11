class InstructorsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]

  before_action :set_instructor, only: %i[show edit update destroy]
  # skip_before_action :authenticate_user!, only: %i[index show]
  def index
    skip_policy_scope
    @instructors = Instructor.all
  end

  def show
    authorize @instructor
    @booking = Booking.new

  end

  def new
    @user = current_user
    @instructor = Instructor.new
    authorize @instructor
  end

  def create
    @instructor = Instructor.new(instructor_params)
    @instructor.user = current_user
    authorize @instructor
    if @instructor.save
      params[:instructor][:languages].each do |language_id|
        InstructorLanguage.create(language_id: language_id, instructor: @instructor)
      end
      params[:instructor][:locations].each do |location_id|
        InstructorLocation.create(location_id: location_id, instructor: @instructor)
      end
      params[:instructor][:packages]&.each do |package_id|
        InstructorPackage.create(package_id: package_id, instructor: @instructor)
      end
      redirect_to instructor_packages_path
    else
      render :new
    end
  end

  def edit
    authorize @instructor
    @instructor_locations = @instructor.locations.pluck(:location_id)
    @available_locations = Location.where.not(id: @instructor_locations)
    @instructor_languages = @instructor.languages.pluck(:language_id)
    @available_languages = Language.where.not(id: @instructor_languages)
  end

  def update
    authorize @instructor
    if params[:instructor][:languages]
      params[:instructor][:languages].each do |language_id|
        InstructorLanguage.create(language_id: language_id, instructor: @instructor)
      end
    end
    if params[:instructor][:locations]
      params[:instructor][:locations].each do |location_id|
        InstructorLocation.create(location_id: location_id, instructor: @instructor)
      end
    end
    if @instructor.update(instructor_params)
      redirect_to instructor_path(@instructor)
    else
      render :edit
    end
  end

  private

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:description, :gender, :phone, photos: [])
  end
end
