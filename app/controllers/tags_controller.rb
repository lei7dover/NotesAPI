class TagsController < ApplicationController
  def create
    @tag=Tag.new(tags_params)
    if @tag.save
      render json: @tag
    else
      render json: @tag.errors
    end
  end

  def show
    @tag = Tag.find_by name:(params[:id])
    Rails.logger.info @tag.inspect
      render json: @tag, serializer: FulltagSerializer, root: :tag
  end

  private

  def tags_params
    params.require(:tags).permit(:name)
  end
end
