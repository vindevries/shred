class InstructorPackagesController < ApplicationController
before_action :authenticate_user!

  def index
    skip_policy_scope
    @packages = Package.all
    @instructor_package = InstructorPackage.new
    @instructor = current_user.instructor
    # params[:instructor][:packages].each do |package_id|
    #     InstructorPackage.create(price: params[:price], instructor_id: @instructor, package_id: package_id)
    #   end
  end

  def create
    @instructor = current_user.instructor
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

  def instructor_package_params
    params.require(:instructor_package).permit(:price, :package_id)
  end
end
