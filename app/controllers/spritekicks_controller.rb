class SpritekicksController < ApplicationController
  
  before_action :find_a_kick, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show, :latest, :oldest]

  def index
    @spritekicks = Spritekick.all  
  end

  def show
  end

  def new
    @spritekick = current_user.spritekicks.build
  end

  def create
    @spritekick = current_user.spritekicks.build(safe_params)

    if @spritekick.save
      redirect_to '/'
    end
  end

  def edit
    if owned(@spritekick)
      @spritekick
    else
      redirect_to '/'
    end
  end

  def update
    @spritekick.update(safe_params)
    redirect_to '/'
  end

  def destroy
    if owned(@spritekick)
      @spritekick.destroy
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def latest
    @spritekicks = Spritekick.get_latest_kicks
  end

  def oldest
    @spritekicks = Spritekick.get_oldest_kicks
  end

  def search
    @spritekicks = Spritekick.search(params[:search])
  end

  def upvote
    user_current = User.where(id: @spritekick.user_id).first
    if owned(@spritekick)
      redirect_to '/'
    else
      Spritekick.move_up(params[:id])
      redirect_to @spritekick
    end
  end

  def downvote
    if owned(@spritekick)
      redirect_to '/'
    else
      Spritekick.move_down(params[:id])
      redirect_to @spritekick
    end
  end

  ############

  private

  def find_a_kick
    @spritekick = Spritekick.find(params[:id])
  end

  def safe_params
    params.require(:spritekick).permit(:title, :author, :description, :url, :image, :votes, :categorie)
  end

  def owned(sprite)
    current_user.id == sprite.user_id
  end

end
