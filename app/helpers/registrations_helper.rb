module RegistrationsHelper
    def avatar_small
        if current_user.avatar.url.present?
            current_user.avatar.url
        else
            '/assets/img/avatar-placeholder-small.png'
        end
    end

    def gallery_img_1_url_small
        if @user.gallery_img_1.url.present?
            @user.gallery_img_1.url
        else
            '/assets/img/gallery-placeholder-top.png'
        end
    end

    def gallery_img_2_url_small
        if @user.gallery_img_2.url.present?
            @user.gallery_img_2.url
        else
            '/assets/img/gallery-placeholder-top.png'
        end
    end

    def gallery_img_3_url_small
        if @user.gallery_img_3.url.present?
            @user.gallery_img_3.url
        else
            '/assets/img/gallery-placeholder-top.png'
        end
    end

    def gallery_img_4_url_small
        if @user.gallery_img_4.url.present?
            @user.gallery_img_4.url
        else
            '/assets/img/gallery-placeholder-top.png'
        end
    end

    def city_names
        city_names = []
        City.all.each do |city|
            city_names.push(city.name)
        end
        city_names

        "<script>
            var input = document.getElementById('city_input');
            var awesomplete = new Awesomplete(input);
            awesomplete.list = #{city_names};
        </script>".html_safe
    end
end
