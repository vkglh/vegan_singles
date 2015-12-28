module ReportsHelper
    def show_reported_message(report)
        if report.reported_message != nil
            report.reported_message.html_safe
        end
    end
end
