class ApplicationPolicy
  def initialize(user, record)
    @user = user
    @record = record
  end

  def allow?
    true
  end

  def deny?
    false
  end
end
