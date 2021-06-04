# == Schema Information
#
# Table name: sgcomments
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  studygroup_id :integer
#  user_id       :integer
#
class Sgcomment < ApplicationRecord
end
