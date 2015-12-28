class HomeController < ApplicationController

            def index
                if current_user
                    if current_user.role == 'nonmember'
                        redirect_to '/'
                    else
                        redirect_to '/feed'
                    end
                end
            end

            def tos
            end
end
