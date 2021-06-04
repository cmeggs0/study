# == Schema Information
#
# Table name: curriculums
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  course_id    :integer
#  professor_id :integer
#
class Curriculum < ApplicationRecord
  # Direct Associations
  belongs_to :course, required: false, class_name: "Course", foreign_key: "course_id"
  belongs_to :professor, required: false, class_name: "Professor", foreign_key: "professor_id"
end
