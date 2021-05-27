require 'dry-initializer'

module ROM

  # @api private
  module Initializer

    # @api private
    def self.extended(base)
      base.extend(Dry::Initializer[undefined: false])
      base.include(InstanceMethods)
    end

    # @api private
    module InstanceMethods
      # Instance options
      #
      # @return [Hash]
      #
      # @api public
      def options
        self.class.dry_initializer.attributes(self)
      end
    end
  end
end
