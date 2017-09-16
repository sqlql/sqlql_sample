class User < ApplicationRecord
  before_save :set_key

  private

  def set_key
    self.key = SecureRandom.uuid
  end
end
