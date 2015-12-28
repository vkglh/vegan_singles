class ReportsController < ApplicationController

    before_filter :admin, except: [:new]

    def admin
        if current_user 
            if current_user.role != 'Admin'
                redirect_to '/'
            end
        else
            redirect_to '/'
        end
    end

    def new
        reason = params[:reason]
        reported_id = params[:id]
        reporter_id = current_user.id

        redirect_to "/profile/#{reported_id}"

        Report.create(:reason => reason, :reported_id => reported_id, :reporter_id => reporter_id)
    end

    def view
    end

    def ignore
        id = params[:id]
        report = Report.find(id)
        report.reviewed = true
        report.save
        redirect_to '/reports/view'
    end

    def ban
        id = params[:id]
        report = Report.find(id)

        user_id = report.reported_id
        user = User.find(user_id)
        user.role = 'banned'
        user.save

        report.reviewed = true
        report.save

        redirect_to '/reports/view'
    end
end
