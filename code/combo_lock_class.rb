class ComboLock
  def initialize(new_password)
    @password = new_password
    @locked   = true
  end

  def unlock(provided_password)
    @locked = false if @password == provided_password
  end

  def lock
    @locked = true 
  end

  def locked?
    @locked
  end
end

combo_lock_a = ComboLock.new("1337")
combo_lock_b = ComboLock.new("1234")

combo_lock_a.unlock("1337")
combo_lock_b.unlock("1337")

puts combo_lock_a.locked? #=> false
puts combo_lock_b.locked? #=> true

combo_lock_b.unlock("1234")
puts combo_lock_b.locked? #=> false
