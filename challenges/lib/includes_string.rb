def includes_string(text)
    pattern = "#TODO"
    word_array = text.split
    index = text.index(pattern)
    if word_array.include?(pattern)
        return "#TODO found at index: #{index}"
    else
        return "#TODO not found"
    end
end