def group_mails(emails)
  # TODO: group email by provider
  hashmail = {}

  emails.each do |x|
    next if x.match(/^.*@\w*\..*$/).nil?
    if hashmail.include?(x.match(/^.*@(\w*)\..*$/)[1])
      hashmail[x.match(/^.*@(\w*)\..*$/)[1]] << x
    else
      hashmail[x.match(/^.*@(\w*)\..*$/)[1]] = [x]
    end
  end

  hashmail
end

def provider?(email, provider)
  # TODO: return true if email is of given provider
  email.match(/^.*@(\w*)\..*$/)[1] == provider
end

