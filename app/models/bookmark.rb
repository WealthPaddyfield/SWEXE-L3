class Bookmark < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :note, length: { maximum: 300 }
end