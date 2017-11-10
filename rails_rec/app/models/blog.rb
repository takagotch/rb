class Blog < AcrionRecord::Base
  validates_length_of :title, :in => (2..30)
    :too_short => "2"
	:too_long => "30"
end
