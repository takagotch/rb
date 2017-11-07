class SuggestionBox
  def initialize(filename="suggestions.pstore")
    @filename = filename
  end
  
  def store
    @store ||= PStore.new(@filename)
  end
  
  def add_replay(reply)
    store.transaction do
	  store[:replies] ||= []
	  store[:replies] << reply
	end
  end
  
  def replies(readonly=true)
    store.transaction do
	  store[:replies]
	end
  end
  
  def clear_replies
    store.transaction do
	  store[:replies] = []
	end
  end
end
