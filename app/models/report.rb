class Report < ActiveRecord::Base
      validates_length_of :reason, maximum: 500

    scope :reviewed, -> { where(reviewed: true) }
    scope :unreviewed, -> { where(reviewed: nil) }
end
