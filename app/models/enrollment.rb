# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  school_id  :integer
#  user_id    :integer
#
class Enrollment < ApplicationRecord
  # Direct Associations
  belongs_to :professor, required: false, class_name: "Professor", foreign_key: "professor_id"
  belongs_to :school, required: false, class_name: "School", foreign_key: "school_id"
end
