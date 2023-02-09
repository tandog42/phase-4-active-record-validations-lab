class Post < ApplicationRecord
  validates :title, presence: true
  validates :content,length: { minimum: 250 }
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :clickbait?

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def clickbait?
        if CLICKBAIT_PATTERNS.none? { |p| p.match title }
            errors.add(:title, "must be clickbait-y")
        end
  end
end
