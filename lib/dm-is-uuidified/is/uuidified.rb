module DataMapper
  module Is
    ##
    # = Is Uuidified
    #   The Uuidified module will configure a model to be uuidified.
    #
    module Uuidified
      def add_advice(callback, dowhen, for_fields)
        Merb.logger.error "### add_advice(callback, dowhen, for_fields)"
        Merb.logger.error "    callback    - #{callback.inspect}"
        Merb.logger.error "    dowhen      - #{dowhen.inspect}"
        Merb.logger.error "    for_fields  - #{for_fields.inspect}"
        self.send(dowhen, callback) do |result|
          ### each interested field...
          for_fields.each do |field_key|
             ### if not setting uuid, and its nil, we set it!
             self.attribute_set(field_key, ::UUID.create.to_s.gsub(/-/,'')) unless
              result.nil? || dirty_attributes.has_key?(field_key)
          end
        end
      end
      
      def is_uuidified(options = {})
        options = {:before => [:valid?], :after => [:create],
                   :for => [:uuid]}. merge!(options)
        for_fields = options[:for]
        ##
        # for each requested callback, check if we have a uuid assigned already
        # on the requested for_fields
        [:before, :after].each do |dowhen|
          options[dowhen].each do |callback|
            add_advice(callback, dowhen, for_fields)
          end
        end
        include DataMapper::Is::Uuidified::InstanceMethods
      end

      module InstanceMethods
        ##
        # turns the 'compressed' uuid stored in table into the full 'dashed'
        # form for easier reading (and couchdb key)
        # --
        # @return <String>
        def uuid_for_humans
          uuidify if self.uuid.to_s.empty?
          @uuid_for_humans ||= "#{self.uuid[0..7]}-#{self.uuid[8..11]}-#{self.uuid[12..15]}-#{self.uuid[16..19]}-#{self.uuid[20..31]}"
        end
      end
    end # Uuidified
  end # Is
end # DataMapper
