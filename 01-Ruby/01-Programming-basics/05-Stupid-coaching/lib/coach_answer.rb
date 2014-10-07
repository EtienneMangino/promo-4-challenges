def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message.split('').last == "?"
    return "Silly question, get dressed and go to work!"
  elsif your_message == "I am going to work right now!"
    return ""
  else
    return "I don't care, get dressed and go to work!"
  end


end

def coach_answer_enhanced(your_message)
   if your_message.split('').last == "?"
    if your_message.upcase == your_message
      return "I can feel your motivation! Silly question, get dressed and go to work!"
    else
      return "Silly question, get dressed and go to work!"
    end
  elsif your_message.upcase == "I AM GOING TO WORK RIGHT NOW!"
    return ""
  else
    if your_message.upcase == your_message
      return "I can feel your motivation! I don't care, get dressed and go to work!"
    else
      return "I don't care, get dressed and go to work!"
    end
  end
 # TODO: return coach answer to your_message, with additional custom rules of yours!
end

