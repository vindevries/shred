class InstructorPackagesController < ApplicationController
before_action :authenticate_user!
before_action :set_instructor, only: %i[index create]
before_action :set_instructor_package, only: %i[destroy]

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
      flash[:notice] = "The package has been added to your offer"
      redirect_to instructor_packages_path(anchor: "package-#{@instructor_package.package_id}")
    else
      @packages = Package.all
      render "index"
    end
  end

  def destroy
    authorize @instructor_package
    @instructor_package.destroy
    redirect_to instructor_packages_path
  end


  private

  def set_instructor
    @instructor = current_user.instructor
  end

  def set_instructor_package
    @instructor_package = InstructorPackage.find(params[:id])
  end

  def instructor_package_params
    params.require(:instructor_package).permit(:price, :package_id)
  end
end
