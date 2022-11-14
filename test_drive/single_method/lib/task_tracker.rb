def task_tracker(text)
  fail "Not a string." if text != text.to_s
  text.include?("#TODO")
end