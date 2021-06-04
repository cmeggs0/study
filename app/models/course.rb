# == Schema Information
#
# Table name: courses
#
#  id                :integer          not null, primary key
#  comments_count    :integer
#  course_number     :string
#  description       :string
#  program           :string
#  quarter           :string
#  schedule          :string
#  section_number    :string
#  studygroups_count :integer
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  school_id         :integer
#
class Course < ApplicationRecord
  # Direct Associations

  has_many  :curriculums, class_name: "Curriculum", foreign_key: "course_id", dependent: :nullify
  has_many  :courseloads, class_name: "Courseload", foreign_key: "course_id", dependent: :destroy
  has_many  :comments, class_name: "Comment", foreign_key: "course_id", dependent: :destroy
  has_many  :studygroups, class_name: "Studygroup", foreign_key: "course_id", dependent: :destroy
  belongs_to :school, required: false, class_name: "School", foreign_key: "school_id"

  # Indirect Associations

  has_many :users, through: :courseloads, source: :user
  has_many :professors, through: :curriculums, source: :professor

end
