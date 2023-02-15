def grammar_checker(text)
    punctuation = ['.', '!', '?']
    if text[0] == text[0].upcase && punctuation.include?(text[-1])
        return "Good grammar!"
    elsif text.strip == ""
        return "ERROR, your text is empty"
    else
        return "Your grammar is incorrect"
    end
end