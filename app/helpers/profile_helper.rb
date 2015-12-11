module ProfileHelper

    def avatar_large
        if @user.avatar.url.present?
            @user.avatar.url
        else
            '/assets/img/avatar-placeholder.png'
        end
    end

    def show_edit_profile
        if current_user.id == @user.id
            "<p><a href='/profile/edit'>Edit Profile</a></p>".html_safe
        end
    end

    def show_name
        if @user.name != nil && @user.name != ''
            ('<strong>' + @user.name + '</strong>').html_safe
        else
            "<span class='text-muted'> (this user has not entered a name yet) </span>".html_safe
        end
    end

    def show_location
        if @user.city != nil
            ("<i class='fa fa-building-o' style='width: 35px;'></i> "  + @user.city).html_safe
        else
            ''
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
            elsif @user.gender == 'Genderfluid'
                icon = 'fa fa-transgender'
            elsif @user.gender == 'Non-binary'
                icon = 'fa fa-genderless'
            else
                ''
            end
            ("<i class='" + icon + "' style='width: 35px;'></i> " + @user.gender).html_safe
        else
            ''
        end
    end

    def show_bio
        if @user.bio != nil && @user.bio != ""
            @user.bio
        else
            "<span class='text-muted'> (this user has not entered a bio yet) </span>".html_safe
        end
    end

    def show_looking_for
        genders = []
         if (@user.looking_for_male == false || @user.looking_for_male == nil ) && (@user.looking_for_female == false || @user.looking_for_female == nil ) && (@user.looking_for_genderfluid == false || @user.looking_for_genderfluid == nil ) && (@user.looking_for_nonbinary == false || @user.looking_for_nonbinary == nil )
            '?'
        else
            if @user.looking_for_male == true
                genders.push 'Male'
            end
            if @user.looking_for_female == true
                genders.push 'Female'
            end
            if @user.looking_for_genderfluid == true
                genders.push 'Genderfluid'
            end
            if @user.looking_for_nonbinary == true
                genders.push 'Non-binary'
            end
            genders.join(", ")
        end
    end

    def show_contact_name
        if @user.name != nil && @user.name != ''
            @user.name
        else
             "<span class='text-muted'> (this user has not entered a name yet) </span>".html_safe
        end
    end

    def show_contact_info
        if (@user.facebook == nil || @user.facebook == '') && (@user.instagram == nil || @user.instagram == '') && (@user.skype == nil || @user.skype == '') && (@user.twitter == nil || @user.twitter == '')
            "<p class='lead text-muted'> (this user has not entered any contact info yet) </span>".html_safe
        else
            html_output = ''
            if @user.facebook != nil && @user.facebook != ''
                html_output += "<div class='col-md-3 col-sm-6'>
                    <a href='" + @user.facebook + "' class='icon icon-square icon-orange icon-hover animated' data-animation='bounceIn' data-animation-delay='300'><i class='fa fa-facebook'></i></a>
                </div>"
            end
            if @user.twitter != nil && @user.twitter != ''
                html_output += "<div class='col-md-3 col-sm-6'>
                    <a href='" + @user.twitter + "' class='icon icon-square icon-orange icon-hover animated' data-animation='bounceIn' data-animation-delay='300'><i class='fa fa-twitter'></i></a>
                </div>"
            end
            if @user.instagram != nil && @user.instagram != ''
                html_output += "<div class='col-md-3 col-sm-6'>
                    <a href='https://www.instagram.com/" + @user.instagram + "' class='icon icon-square icon-orange icon-hover animated' data-animation='bounceIn' data-animation-delay='300'><i class='fa fa-instagram'></i></a>
                </div>"
            end
            if @user.skype != nil && @user.skype != ''
                html_output += "<div class='col-md-3 col-sm-6'>
                    <a href='skype:" + @user.skype + "?userinfo'  class='icon icon-square icon-orange icon-hover animated' data-animation='bounceIn' data-animation-delay='300'><i class='fa fa-skype'></i></a>
                </div>"
            end
            html_output.html_safe
        end
    end

end
