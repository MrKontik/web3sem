class Api::V1::GeeksController < ApplicationController
  before_action :set_geek, only: [:show, :update, :destroy]

  # для выполнения routes с ассоциацией
  def index
    if params[:apply_id]
      @geeks = Apply.find(params[:apply_id]).applies
    else
      @geeks = Geek.all
    end
    render json: { geeks: @geeks }, except: [:id, :created_at, :updated_at]
  end

  def show
    render json: @geek
  end

  def create
    @geek = Geek.new(geek_params)
    if @geek.save
      render json: @geek.as_json, status: :created
    else
      render json: {user: @geek.errors, status: :no_content}
    end
  end

  def update
    if @geek.update(geek_params)
      render json: @geek
    else
      render json: @geek.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @geek.destroy
    render json: { deleted_geek: @geek,
                   code: 200,
                   status: :success,
    }, except: [:created_at, :updated_at]
  end

  private
  def set_geek
    @geek = Geek.find(params[:id])
  end

  def geek_params
    params.permit(:job_id, :geek_id, :read, :invited, :id)
  end
end
