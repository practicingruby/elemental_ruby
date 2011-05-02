###########################
# Crypto-combination lock #
###########################

require "digest/sha1"

combo_lock = Object.new

def combo_lock.set_password(new_password)
  hashed_password  = Digest::SHA1.hexdigest(new_password)
  @stored_password =  hashed_password unless locked?
end

def combo_lock.lock
  @locked = true if @stored_password
end

def combo_lock.unlock(entered_password)
  hashed_password = Digest::SHA1.hexdigest(entered_password)
  @locked         = false if hashed_password == @stored_password
end

def combo_lock.locked?
  @locked
end
