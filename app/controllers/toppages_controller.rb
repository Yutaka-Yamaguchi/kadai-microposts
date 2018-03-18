class ToppagesController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :favs]
  
  def index
    @user = current_user
    @micropost = current_user.microposts.build  # form_for 用
    @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
  end
  
  def favs
    @user = User.find(params[:id])
    @microposts = @user.favs.page(params[:page])
    counts(@user)
  end
  
  def favoritings
    @user = User.find(params[:id])
    @favoritings = @user.favoritings.page(params[:page])
    counts(@user)
  end
  
#  def favoriters
#    @user = User.find(params[:id])
#    @favoriters = @user.favoriters.page(params[:page])
#    counts(@user)
#  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def micropost_params
    params.require(:micropost).permit(:content, :user)
  end
end
