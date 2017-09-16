class User < ApplicationRecord
  before_save :set_key

  def for_haute_couture_sql
    base = User.select(:id, :name, :created_at, :updated_at)
    base.where(id: id).or(base.where(privacy: false)).to_sql
  end

  private

  def set_key
    self.key = SecureRandom.uuid
  end
end
