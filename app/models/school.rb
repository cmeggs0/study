# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class School < ApplicationRecord
  # Direct Associations
  has_many  :enrollments, class_name: "Enrollment", foreign_key: "school_id", dependent: :destroy
  has_many  :employers, class_name: "Employer", foreign_key: "school_id", dependent: :destroy
  has_many  :courses, class_name: "Course", foreign_key: "school_id", dependent: :destroy

  # Indirect Associations
  has_many :users, through: :enrollments, source: :user
  has_many :professors, through: :employers, source: :professor
end
