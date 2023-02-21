class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    @diary = diary
    @lock = true
  end

  def read
    return @diary.read if !@lock
    fail "Go away!"
  end

  def lock
    @lock = true
  end

  def unlock
    @lock = false
  end
end