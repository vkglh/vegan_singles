module RegistrationsHelper
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
