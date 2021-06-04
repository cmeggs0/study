# == Schema Information
#
# Table name: studygroups
#
#  id               :integer          not null, primary key
#  max_members      :integer
#  members_count    :integer
#  name             :string
#  sgcomments_count :integer
#  timeblock        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  course_id        :integer
#  originator_id    :integer
#
class Studygroup < ApplicationRecord
  # Direct Associations
  belongs_to :course, required: false, class_name: "Course", foreign_key: "course_id", counter_cache: true
  has_many  :members, class_name: "Member", foreign_key: "studygroup_id", dependent: :destroy
  has_many  :sgcomments, class_name: "Sgcomment", foreign_key: "studygroup_id", dependent: :destroy

  #Indirect Associations
  has_many :users, through: :members, source: :user
end
