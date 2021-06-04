# == Schema Information
#
# Table name: employers
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  professor_id :integer
#  school_id    :integer
#
class Employer < ApplicationRecord
end
