class ProfileController < ApplicationController

    before_filter :nonmember

    def nonmember
        if current_user == nil || current_user.role == 'nonmember'
            render 'nonmember'
        end
    end

    def edit
    end

    def show 

        id = params[:id]
        @user = User.find(id)

        if @user.role == 'banned' || @user.role == 'nonmember'
            render 'inactive'
        end

        rescue ActiveRecord::RecordNotFound
        render 'inactive'

    end
    
end
