module ProfileHelper

    def show_name
        if @user.name != nil
            ('<strong>' + @user.name + '</strong>').html_safe
        else
            "<span class='text-muted'> (this user has not entered a name yet) </span>".html_safe
        end
    end

    def show_location
        if @user.city != nil
            ("<i class='fa fa-building-o' style='width: 35px;'></i> "  + @user.city + "<span class='text-muted'> " +  show_distance + "</span>").html_safe
        else
            ''
        end
    end

    def show_distance
        if current_user
            if current_user.id != @user.id && current_user.city != nil && @user.city != nil
                '(' + current_user.distance_to(@user).to_miles.round.to_s + ' miles away)'
            else
                ''
            end
        end
    end

    def show_age
        if @user.date_of_birth != nil
            ("<i class='fa fa-birthday-cake' style='width: 35px;'></i> " + @user.age.to_s + " years old").html_safe
        else
            ''
        end
    end

    def show_gender
        if @user.gender != nil
            icon = ''
            if @user.gender == "Male"
                icon = 'fa fa-mars'
            elsif @user.gender == 'Female'
                icon = 'fa fa-venus'
            elsif @user.gender == 'Bigender'
                icon = 'fa fa-transgender'
            elsif @user.gender == 'Agender'
                icon = 'fa fa-genderless'
            else
                ''
            end
            ("<i class='" + icon + "' style='width: 35px;'></i> " + @user.gender).html_safe
        else
            ''
        end
    end

    def show_looking_for
    end

end
