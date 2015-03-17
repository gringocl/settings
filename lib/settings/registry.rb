class Settings
  class Registry
    attr_accessor :data

    def self.instance
      @instance ||= new
    end

    def initialize
      @data = {}
    end

    def register(cls, attr_name)
      unless setting?(cls, attr_name)
        registered?(cls) ? @data[cls].push(attr_name) : @data[cls] = [attr_name]
      end

      @data[cls]
    end

    def setting?(cls, attr_name)
      registered?(cls) ? @data[cls].include?(attr_name) : false
    end

    def registered?(cls)
      !!@data[cls]
    end
  end
end
