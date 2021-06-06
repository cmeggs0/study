# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  email             :string
#  first_name        :string
#  hidden            :boolean
#  last_name         :string
#  memberships_count :integer
#  password_digest   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  # Direct Associations
  has_many  :courseloads, class_name: "Courseload", foreign_key: "user_id", dependent: :destroy
  has_many  :enrollments, class_name: "Enrollment", foreign_key: "user_id", dependent: :destroy
  has_many  :memberships, class_name: "Member", foreign_key: "user_id", dependent: :destroy
  has_many  :sgcomments, class_name: "Sgcomment", foreign_key: "user_id", dependent: :destroy
  has_many  :comments, class_name: "Comment", foreign_key: "user_id", dependent: :destroy

  #Indirect Associations
  has_many :courses, through: :courseloads, source: :course
  has_many :schools, through: :enrollments, source: :school
  has_many :studygroups, through: :memberships, source: :studygroup

  def name
    return self.first_name + " " + self.last_name
  end
end
