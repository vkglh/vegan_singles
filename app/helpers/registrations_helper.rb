module RegistrationsHelper
    def avatar_url
        if current_user.avatar.url.present?
            current_user.avatar.url
        else
            '/assets/img/avatar-placeholder-small.png'
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
