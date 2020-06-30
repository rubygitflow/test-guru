class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def rewards
    @badges = current_user.badges.group('id')
    render :index
  end
end
