class CreateSpreeShipmentTimeSlotSinglePlans < ActiveRecord::Migration
  def change
    create_table :spree_shipment_time_slot_single_plans do |t|
      t.float :starting_hour
      t.float :ending_hour
      t.string :order_limit

      t.timestamps
    end
  end
end
