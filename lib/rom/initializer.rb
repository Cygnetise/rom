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
        @__options__ ||= self.class.dry_initializer.definitions.values.each_with_object({}) do |item, obj|
          obj[item.target] = instance_variable_get(item.ivar)
        end
      end
    end
  end
end
