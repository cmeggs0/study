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
end
