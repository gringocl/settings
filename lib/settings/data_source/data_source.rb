class Settings
  module DataSource
    def self.build(input)
      logger = Telemetry::Logger.get self
      logger.trace "Building (Data Source Type: #{input.class.name})"

      data_source_type = type(input)

      data_source_type.build(input).tap do |instance|
        logger.debug "Built (#{instance})"
      end
    end

    def self.type(input)
      return Settings::DataSource::Hash if input.is_a?(::Hash)
      return Settings::DataSource::File if input.is_a?(String)

      raise "Data source is not supported: #{input}"
    end
  end
end
