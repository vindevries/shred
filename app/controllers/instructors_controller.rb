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
      # params[:costume][:tags].each do |tag_id|
      #   CostumeTag.create(tag_id: tag_id, costume: @costume)
    # end
      redirect_to instructor_path(@instructor)
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end



  private

   def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:description, :gender, :phone, photos: [])
  end
end
