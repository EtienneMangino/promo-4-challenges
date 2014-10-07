def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message.end_with?("?")
    "Silly question, get dressed and go to work!"
  elsif your_message == "I am going to work right now!"
    ""
  else
    "I don't care, get dressed and go to work!"
  end


end

def coach_answer_enhanced(your_message)

   if your_message.end_with?("?")
      return "#{"I can feel your motivation! " if your_message.upcase == your_message}Silly question, get dressed and go to work!"
  elsif your_message.upcase == "I AM GOING TO WORK RIGHT NOW!"
    return ""
  else
      return "#{"I can feel your motivation! " if your_message.upcase == your_message}I don't care, get dressed and go to work!"
  end


 # TODO: return coach answer to your_message, with additional custom rules of yours!
end

