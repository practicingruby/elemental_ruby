###################################
# Combination-lock Implementation #
###################################

combo_lock = Object.new

def combo_lock.set_password(new_password)
  @stored_password = new_password unless locked?
end

def combo_lock.lock
  @locked = true if @stored_password
end

def combo_lock.unlock(entered_password)
  @locked = false if entered_password == @stored_password
end

def combo_lock.locked?
  @locked
end

##############################
# Combination-lock Interface #
##############################

combo_lock.set_password("1337")
combo_lock.lock

p combo_lock.locked? #=> true

combo_lock.unlock("1336")

p combo_lock.locked? #=> true

combo_lock.unlock("1337")

p combo_lock.locked? #=> false
