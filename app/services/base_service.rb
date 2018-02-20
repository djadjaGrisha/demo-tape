class BaseService
  class << self
    def perform(**args)
      new(args).execute
    end
  end

  def execute
    raise NotImplementedError, error_msg
  end

  private

  def error_msg
    "Need to be redefined in #{self.class.name} class!!!"
  end
end
