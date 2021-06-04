# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  studygroup_id :integer
#  user_id       :integer
#
class Member < ApplicationRecord
end
