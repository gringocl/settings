class Settings
  class DataSource
    class Hash < DataSource
      def self.build(source)
        logger = Telemetry::Logger.get self

        logger.trace "Building"

        new(source).tap do |instance|
          Telemetry::Logger.configure instance
          logger.debug "Built"
        end
      end

      def get_data
        logger.trace "Converting the raw source data to Confstruct"
        Confstruct::Configuration.new(source).tap do |instance|
          logger.debug "Converted the raw source data to Confstruct"
        end
      end
    end
  end
end