module SearchHelper
    def show_looking_for
        genders = []
         if (current_user.looking_for_male == nil || current_user.looking_for_male == false ) && (current_user.looking_for_female == nil || current_user.looking_for_female == false ) && (current_user.looking_for_genderfluid == nil || current_user.looking_for_genderfluid == false ) && (current_user.looking_for_nonbinary == nil || current_user.looking_for_nonbinary == false )
            '?'
        else
            if current_user.looking_for_male == true
                genders.push 'Male'
            end
            if current_user.looking_for_female == true
                genders.push 'Female'
            end
            if current_user.looking_for_genderfluid == true
                genders.push 'Genderfluid'
            end
            if current_user.looking_for_nonbinary == true
                genders.push 'Non-binary'
            end
            genders.join(", ")
        end
    end
end
