class Band < ActiveRecord::Base
  has_many :albums,
  foreign_key: :band_id,
  class_name: "Album",
  primary_key: :id

  has_many :tracks
end
