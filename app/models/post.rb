# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  content    :text
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence: true
    validates :content, presence: true
end
