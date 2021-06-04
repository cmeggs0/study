# == Schema Information
#
# Table name: courses
#
#  id             :integer          not null, primary key
#  comments_count :integer
#  course_number  :string
#  description    :string
#  quarter        :string
#  schedule       :time
#  section_number :string
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  school_id      :integer
#
class Course < ApplicationRecord
end
