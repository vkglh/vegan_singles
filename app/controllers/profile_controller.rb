class ProfileController < ApplicationController

    def edit
    end

    def show 
        id = params[:id]
        @user = User.find(id)
    end
    
end
