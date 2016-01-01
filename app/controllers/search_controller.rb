class SearchController < ApplicationController

    before_filter :nonmember

    def nonmember
        if current_user == nil || current_user.role == 'Nonmember'
            redirect_to '/'
        end
    end

    def index
        
    end

    def results
        # Find gender matches
        searcher_gender = params[:searcher_gender]
        @gender_matches = []

        User.male.each do |user|
            @gender_matches.push(user)
        end

        User.female.each do |user|
            @gender_matches.push(user)
        end

        User.genderfluid.each do |user|
            @gender_matches.push(user)
        end

        User.nonbinary.each do |user|
            @gender_matches.push(user)
        end

        #Filter banned/nonmembers
        @members = []
        @gender_matches.each do |gender_match|
            if gender_match.role == 'Admin' || gender_match.role == 'Member'
                @members.push(gender_match)
            end
        end

        #Filter users with no images/names
        @users_with_info = []
        @members.each do |member|
            if (member.avatar.url != nil) &&(member.name != nil && member.name != '')
                @users_with_info.push(member)
            end
        end

        @results = @users_with_info
    end

end
