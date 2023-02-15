def includes_string(text)
    pattern = "#TODO"
    index = text.index(pattern)
    if text.include?(pattern)
        return "#TODO found at index: #{index}"
    else
        return "#TODO not found"
    end
end

