module Spree

  #
  # This class handles the creation of single ShipmentTimeSlot
  # objects as part of the date planner.
  # ShipmentTimeSlotSinglePlan is not specific about the actual date
  # for the time slot rather then its time span set by the 
  # starting_at and ending_at methods
  #
  class ShipmentTimeSlotSinglePlan < Spree::Base
    validates_presence_of :starting_hour
    validates_presence_of :ending_hour
    validates_numericality_of :order_limit, only_integer: true, greater_than: 0
    validate :ending_hour_should_be_greater_then_starting_hour

    #
    # Builds a new ShipmentTimeSlot instance
    # and returns it without presisting
    #
    # @param [Date] date Any specific date object that responds to beginning_of_day 
    #
    # @return [ShipmentTimeSlot] Returns a new ShipmentTimeSlot object
    # 
    def build_time_slot(date)

      # Validate
      raise(ArgumentError, "date must be of ruby type Date") unless date.respond_to?(:beginning_of_day)

      return Spree::ShipmentTimeSlot.new(
        starting_at: date.beginning_of_day + starting_hour,
        ending_at: date.beginning_of_day + ending_hour,
        order_limit: order_limit
        )
    end

    private

      def ending_hour_should_be_greater_then_starting_hour
        return unless ending_hour && starting_hour
        if ending_hour <= starting_hour
          errors.add(:ending_hour, "can't be equal or less then starting_hour")
        end
      end

  end
end


