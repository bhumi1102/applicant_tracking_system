class Applicant < ApplicationRecord
  include PgSearch::Model

  belongs_to :job

  has_one_attached :resume
  
  pg_search_scope :text_search,
    against: %i[first_name last_name email],
    using: {
      tsearch: {
        any_word: true,
        prefix: true
      }
    }
    
  enum stage: {
    application: 'application',
    interview: 'interview',
    offer: 'offer',
    hired: 'hire'
  }

  enum status: {
    active: 'active',
    inactive: 'inactive'
  }

  validates_presence_of :first_name, :last_name, :email

  def name
    [first_name, last_name].join(' ')
  end
end