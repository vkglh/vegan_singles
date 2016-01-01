class User < ActiveRecord::Base

  scope :male, -> { where(gender: 'Male')  }
  scope :female, -> { where(gender: 'Female')  }
  scope :genderfluid, -> { where(gender: 'Genderfluid')  }
  scope :nonbinary, -> { where(gender: 'Non-binary')  }

  mount_uploader :avatar, AvatarUploader
  mount_uploader :gallery_img_1, GalleryOneUploader
  mount_uploader :gallery_img_2, GalleryTwoUploader
  mount_uploader :gallery_img_3, GalleryThreeUploader
  mount_uploader :gallery_img_4, GalleryFourUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_length_of :bio, maximum: 5000
  validate :dob_check
  validate :city_check
  validate :gender_check
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  def city_check
    if self.city != nil && self.city != ''
       errors.add(:city, '- Please choose a city from the dropdown.') if (City.where(:name => self.city)[0] == nil)
    end
  end


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

end
