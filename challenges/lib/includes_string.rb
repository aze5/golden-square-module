def includes_string(text)
    pattern = "#TODO"
    word_array = text.split
    if word_array.include?(pattern)
        return "#TODO found at index: 12"
    else
        return "#TODO not found"
    end
end