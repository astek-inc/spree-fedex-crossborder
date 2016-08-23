module SpreeFedexCrossborder
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Configuration
    attr_accessor :surcharge_amount
    def initialize
      @surcharge_amount = 0
    end
  end
end
