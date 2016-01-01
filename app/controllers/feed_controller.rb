class FeedController < ApplicationController

    before_filter :nonmember

    def nonmember
        if current_user == nil || current_user.role == 'Nonmember'
            redirect_to '/'
        end
    end

    def index
    end
end
