class Logger < self
  private_class_method :new
  @@logger = nil

  def create
    @@logger == new unless @@logger
    @@logger
  end
end
