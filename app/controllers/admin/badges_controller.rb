class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[new edit]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      flash[:notice] = t('.success')
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    flash[:notice] = t('.success')
    redirect_to admin_badges_url
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      flash[:notice] = t('.success')
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  private

  def set_categories
    @categories = Category.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

      UserBadgeService.new(@test_passage)

  def badge_params
    params.require(:badge).permit(:title, :image_path, :rule, :value)
  end
end

