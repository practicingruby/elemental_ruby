require "digest/sha1"

module Locklike
  def unlock(entered_password)
    @locked = false if valid_password?(entered_password) 
  end

  def lock
    @locked = true 
  end

  def locked?
    @locked
  end
end

class ComboLock
  include Locklike

  def initialize(new_password)
    @stored_password = new_password
    @locked          = true
  end

  def valid_password?(entered_password)
    @stored_password == entered_password
  end
end

class CryptoComboLock
  include Locklike

  def initialize(new_password)
    @stored_password = sha1(new_password)
    @locked          = true
  end

  def valid_password?(entered_password)
    @stored_password == sha1(entered_password)
  end

  def sha1(password)
    Digest::SHA1.hexdigest(password)
  end
end

combo_lock_a = ComboLock.new("1337")
combo_lock_b = CryptoComboLock.new("1234")

combo_lock_a.unlock("1337")
combo_lock_b.unlock("1337")

puts combo_lock_a.locked? #=> false
puts combo_lock_b.locked? #=> true

combo_lock_b.unlock("1234")
puts combo_lock_b.locked? #=> false
