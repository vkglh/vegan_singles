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
        reported_message = params[:reported_message]
        reported_id = params[:id]
        reporter_id = current_user.id

        redirect_to "/profile/#{reported_id}"

        Report.create(:reason => reason, :reported_id => reported_id, :reporter_id => reporter_id, :reported_message => reported_message)
    end

    def view
    end

    def ignore
        id = params[:id]
        status = params[:status]

        report = Report.find(id)
        report.status = status
        report.reviewed = true
        report.save

        redirect_to '/reports/view'
    end

    def ban
        id = params[:id]
        status = params[:status]
        report = Report.find(id)

        user_id = report.reported_id
        user = User.find(user_id)
        user.role = 'Banned'
        user.save

        report.reviewed = true
        report.status = status
        report.save

        redirect_to '/reports/view'
    end
end
