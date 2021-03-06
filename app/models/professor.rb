# == Schema Information
#
# Table name: professors
#
#  id         :integer          not null, primary key
#  bio        :string
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

  def full_name
    if self.last_name != nil && self.first_name != nil
      return self.first_name + " " + self.last_name
    elsif self.first_name != nil
      return self.first_name
    else
      return self.last_name
    end
  end
end
