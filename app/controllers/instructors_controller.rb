class InstructorsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :avaliable_everything, only: %i[edit new]
  before_action :set_instructor, only: %i[show edit update destroy]

  # skip_before_action :authenticate_user!, only: %i[index show]
  def index
    skip_policy_scope

    if params[:search].present?
      @instructors = Instructor.all
      if params[:search][:location].present?
        @instructors = @instructors.joins(:locations).where("locations.name ILIKE ?", "%#{params[:search][:location]}%").distinct
      end
      if params[:search][:language].present?
        @instructors = @instructors.joins(:languages).where(languages: { name: params[:search][:language] }).distinct
      end
      if params[:search][:package].present?
        @instructors = @instructors.joins(:packages).where("packages.title ILIKE ?", "%#{params[:search][:package]}%").distinct
      end
      if params[:search][:gender].present?
        @instructors = @instructors.where("gender ILIKE ?", "%#{params[:search][:gender]}%")
      end
      # @instructors = @instructors.where(size: params[:search][:size]) if params[:search][:size].present?

      # @instructors = @instructors.joins(:tags).where(tags: { name: params[:search][:tag] }).distinct if params[:search][:tag].present?
    else
      @instructors = Instructor.joins(:instructor_packages).order('instructor_packages.price').uniq
    end
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
    @user = current_user
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

  # def update
  #   authorize @instructor
  #   if params[:languages]
  #     params[:languages].each do |language|
  #       InstructorLanguage.create(language: Language.where("name =?", language)[0], instructor: @instructor)
  #     end
  #   end
  #   if params[:locations]
  #     params[:locations].each do |location|
  #       InstructorLocation.create(location: Location.where("name =?", location)[0], instructor: @instructor)
  #     end
  #   end
  #   if @instructor.update(instructor_params)
  #     redirect_to instructor_path(@instructor)
  #   else
  #     render :edit
  #   end
  # end

  private

  def avaliable_everything
    @instructor = Instructor.new
    @instructor_locations = @instructor.locations.pluck(:location_id)
    @available_locations = Location.where.not(id: @instructor_locations)
    @instructor_languages = @instructor.languages.pluck(:language_id)
    @available_languages = Language.where.not(id: @instructor_languages)
  end
  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:description, :gender, :phone, photos: [])
  end
end
