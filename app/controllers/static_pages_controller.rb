class StaticPagesController < ApplicationController
    def home
        if logged_in?
            @micropost = current_user.microposts.build 
            @user = current_user
            @feed_items = current_user.feed.paginate(page: params[:page], per_page:12)
        end
    end

    def about
    end

    def contact
    end
end
