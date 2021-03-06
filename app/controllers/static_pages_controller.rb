class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = Micropost.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def timer
    render layout: false;
  end

  def timer_d
    render layout: false
  end

  def timer_m
    render layout: false
  end

end
