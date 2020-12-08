class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
  end

  def show
  end


  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    @instructor.user = current_user
    # authorize @instructor
    if @instructor.save
      # params[:costume][:tags].each do |tag_id|
      #   CostumeTag.create(tag_id: tag_id, costume: @costume)
    # end
      redirect_to instructor_path(@instructor)
    else
      render :new
    end
  end

  private

  def instructor_params
    params.require(:instructor).permit(:description, :gender, photos: [])
  end
end
