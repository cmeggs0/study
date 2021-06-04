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
  # Direct Associations
  belongs_to :user, required: false, class_name: "User", foreign_key: "user_id", counter_cache: :memberships_count
  belongs_to :studygroup, required: false, class_name: "Studygroup", foreign_key: "studygroup_id", counter_cache: true  
end
