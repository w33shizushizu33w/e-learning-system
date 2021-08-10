class AdminController < ApplicationController

    def create
    end

    private
    def admin_user
        redirect_to(root_@use) unless correct_user.is_admin?
    end
end
