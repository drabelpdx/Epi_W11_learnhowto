class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    @previous = Lesson.where("number < ?", @lesson.number).last
    @next = Lesson.where("number > ?", @lesson.number).first
  end

  def new
    @section = Section.find(params[:section_id])
    @lesson = Lesson.new
  end

  def create
    @section = Section.find(params[:section_id])
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to  section_path(@lesson.section)
    else
      render :new
    end
  end

  def edit
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @section = Section.find(params[:section_id])
    @lesson= Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to section_path(@lesson.section)
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to section_path(@section)
  end

  private
  def lesson_params
    params.require(:lesson).permit(:name, :content, :number, :section_id)
  end
end
