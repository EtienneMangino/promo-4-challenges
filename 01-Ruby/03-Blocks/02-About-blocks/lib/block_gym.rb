def tag(tag_name, attr = nil)
  # TODO:  Build HTML tags around  content given in the block
  #        The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  if attr.nil?
    "<#{tag_name}>#{yield}</#{tag_name}>"
  else
    "<#{tag_name} #{attr[0]}='#{attr[1]}'>#{yield}</#{tag_name}>"
  end
end
puts tag("h1") { "Some Title" }

def timer_for
  # TODO:  Return time taken to execute the given block
  start_time = Time.now
  yield
  Time.now - start_time
end
