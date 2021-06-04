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
end
