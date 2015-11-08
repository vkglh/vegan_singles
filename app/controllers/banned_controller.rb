class BannedController < ApplicationController

    skip_before_filter :banned

    def index
    end

end
