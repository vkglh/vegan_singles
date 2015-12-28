class SearchController < ApplicationController

    before_filter :nonmember

    def nonmember
        if current_user == nil || current_user.role == 'nonmember'
            redirect_to '/'
        end
    end

    def index
        
    end

end
