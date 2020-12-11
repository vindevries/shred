class InstructorPackagesController < ApplicationController
before_action :authenticate_user!
before_action :set_instructor, only: %i[index create]
before_action :set_instructor_package, only: %i[edit update]

  def index
    skip_policy_scope
    @packages = Package.all
    @instructor_package = InstructorPackage.new
    # params[:instructor][:packages].each do |package_id|
    #     InstructorPackage.create(price: params[:price], instructor_id: @instructor, package_id: package_id)
    #   end
  end

  def create
    @instructor_package = InstructorPackage.new(instructor_package_params)
    @instructor_package.instructor = @instructor
    authorize @instructor_package
    if @instructor_package.save
      redirect_to instructor_packages_path
    else
      @packages = Package.all
      render "index"
    end
  end

  def edit

  end

  def update

  end

  private

  def set_instructor
    @instructor = current_user.instructor
  end

  def set_instructor_packages
    @instructor_package = InstructorPackage.find(params[:id])
  end

  def instructor_package_params
    params.require(:instructor_package).permit(:price, :package_id)
  end
end
