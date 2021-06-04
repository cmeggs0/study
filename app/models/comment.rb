# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#  user_id    :integer
#
class Comment < ApplicationRecord
end
