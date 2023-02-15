def make_snippet(string)
    if string.length > 5
        return string[0..4] + "..."
    else
        return string
    end
end

def count_words(string)
    lst = string.split()
    return lst.length
end