def grammar_checker(text)
    punctuation = ['.', '!', '?']
    if text[0] == text[0].upcase && punctuation.include?(text[-1])
        return "Good grammar!"
    else
        return "Your grammar is incorrect"
    end
end