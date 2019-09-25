class Api::V1::CoursesController < Api::V1::ApplicationController
  expose :courses, -> { Course.all }
  expose :course

  def index
    render_response(status: :ok, obj: CourseSerializer.new(courses))
  end

  def show
    render_response(status: :ok, obj: CourseSerializer.new(course))
  end

  def create
    render_response(status: :ok, obj: CourseSerializer.new(course)) if course.save!
  end

  def update
    render_response(status: :ok, obj: CourseSerializer.new(course)) if course.update!(course_params)
  end

  def destroy
    if course.destroy
      render_response(status: :ok)
    else
      render_response(status: :unprocessable_entity)
    end
  end

  private

  def Course_params
    params.require(:course).permit(:name, :category_id, :author_id, :status)
  end
end