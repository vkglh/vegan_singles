class User < ActiveRecord::Base

  require 'haversine'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def age
        now = Time.now.utc.to_date
        now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
    end

    def ban
        role = 'banned'
        save
    end

    def compatibility_age_with(user)
      age_range = (user.age - age).abs
      score = 100 - age_range * 5 
      if score >= 0 then score else 0 end
    end

    def compatibility_interests_with(user)
      100
    end

    def compatibility_overall_with(user)
      compatibility_age_with(user) / 1
    end

    def distance_to(user)
        city_1 = City.where(name: city)[0]
        city_2 = City.where(name: user.city)[0]
        Haversine.distance(city_1.lat, city_1.lng, city_2.lat, city_2.lng)
    end

end
