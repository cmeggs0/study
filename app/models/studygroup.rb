# == Schema Information
#
# Table name: studygroups
#
#  id               :integer          not null, primary key
#  members_count    :integer
#  sgcomments_count :integer
#  timeblock        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  course_id        :integer
#
class Studygroup < ApplicationRecord
end
