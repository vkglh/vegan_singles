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
        @gender_matches = []

        if current_user.looking_for_male == true
            User.male.each do |user|
                @gender_matches.push(user)
            end
        end

        if current_user.looking_for_female == true
            User.female.each do |user|
                @gender_matches.push(user)
            end
        end

        if current_user.looking_for_genderfluid == true
            User.genderfluid.each do |user|
                @gender_matches.push(user)
            end
        end

        if current_user.looking_for_nonbinary == true
            User.nonbinary.each do |user|
                @gender_matches.push(user)
            end
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
