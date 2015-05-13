class Settings
  class DataSource
    module Build
      def self.!(input=nil)
        logger = Telemetry::Logger.get self
        logger.trace "Building (Input Type: #{input.class.name})"

        data_source_type = type(input)

        data_source_type.build(input).tap do |instance|
          logger.debug "Built (#{instance})"
        end
      end

      def self.type(input=nil)
        return Settings::DataSource::Hash if input.is_a?(::Hash)
        return Settings::DataSource::File if input.is_a?(String) || input.nil?

        raise "Input is not supported: #{input}"
      end
    end
  end
end