class Keep < ApplicationRecord
  belongs_to :user
  has_many :keepcomments
end
