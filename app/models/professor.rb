# == Schema Information
#
# Table name: professors
#
#  id         :integer          not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Professor < ApplicationRecord
  # Direct Associations

  has_many  :curriculums, class_name: "Curriculum", foreign_key: "professor_id", dependent: :destroy
  has_many  :employers, class_name: "Employer", foreign_key: "professor_id", dependent: :destroy

  # Indirect Associations

  has_many :courses, through: :curriculums, source: :course
  has_many :schools, through: :employers, source: :school
end
