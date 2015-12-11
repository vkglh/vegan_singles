class User < ActiveRecord::Base

  require 'haversine'

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_length_of :bio, maximum: 5000
  validate :dob_check
  validate :gender_check
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  def gender_check
    if self.gender
       errors.add(:gender, '- Your gender is not valid') if (self.gender != 'Male') && (self.gender != 'Female') && (self.gender != 'Genderfluid') && (self.gender != 'Non-binary')
    end
  end

  def dob_check
    if self.date_of_birth
      errors.add(:birthdate, '- Your age must be over 18.') if self.date_of_birth > 18.years.ago.to_date
    end
  end

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

end
