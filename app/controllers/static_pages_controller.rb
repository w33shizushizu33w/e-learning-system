class StaticPagesController < ApplicationController
    def home
        if logged_in?
            @user = current_user
        end
    end

    def about
    end

    def contact
    end
end
