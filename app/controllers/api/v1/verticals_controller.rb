class Api::V1::VerticalsController < Api::V1::ApplicationController
  expose :verticals, -> { Vertical.all }
  expose :vertical

  
  def index
    render_response(status: :ok, obj: VerticalSerializer.new(verticals))
  end

  def show
    render_response(status: :ok, obj: VerticalSerializer.new(vertical))
  end

  def create
    render_response(status: :ok, obj: VerticalSerializer.new(vertical)) if Vertical.save!
  end

  def update
    render_response(status: :ok, obj: VerticalSerializer.new(vertical)) if Vertical.update!(vertical_params)
  end

  def destroy
    if Vertical.destroy
      render_response(status: :ok)
    else
      render_response(status: :unprocessable_entity)
    end
  end

  private

  def vertical_params
    params.require(:vertical).permit(:name)
  end
end