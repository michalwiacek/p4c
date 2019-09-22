class Api::V1::CategoriesController < Api::V1::ApplicationController
  expose :categories, -> { Category.all }
  expose :category

  def index
    render_response(status: :ok, obj: CategorySerializer.new(categories))
  end

  def show
    render_response(status: :ok, obj: CategorySerializer.new(category))
  end

  def create
    render_response(status: :ok, obj: CategorySerializer.new(category)) if Category.save!
  end

  def update
    render_response(status: :ok, obj: CategorySerializer.new(category)) if Category.update!(category_params)
  end

  def destroy
    if Category.destroy
      render_response(status: :ok)
    else
      render_response(status: :unprocessable_entity)
    end
  end

  private

  def category_params
    params.require(:category).permit(:id, :name, :vertical_id, :status)
  end
end