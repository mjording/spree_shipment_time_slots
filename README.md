SpreeShipmentTimeSlots
======================

Spree shipment time slots extension:

This extension enables easy grouping for orders based on time slots.

Motivation
----------
Many stores deliver their orders on a daily basis (i.e grocery stores) and in large baches.
Spree gives control over each individual shipment but assumes the shipping is done by external
companies that ship each order to it's owner.
Many stores deliver their goods in predefined shifts (i.e sunday 10am - 2pm, sunday 4pm - 6p, monday 11am - 7pm), spree_shipment_time_slots extension allows planning of these shifts and predefines shipment_time_slot objects which can then be selected by the end-user upon checkout.

Notes
-----
- English locale file needed
- Only works with checkout confirmation step enabled 
  (otherwise user won't be able to select a time slot)
- If an order was already associated with a ShipmentTimeSlot object, and the day plan
  was changed for that day, new ShipmentTimeSlot instances will be created but the old object
  will not be deleted and the order will still be associated to it.
- Shimpent instances won't validate the presence of shipmnet_time_slots, this means that
  a user is able to complete the checkout if no there are no time_slots available
  it is up to the manager to take care of it from there. (This is by design but maybe should be changed?)

Installation
------------

Add spree_shipment_time_slots to your Gemfile:

```ruby
gem 'spree_shipment_time_slots'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_shipment_time_slots:install
```

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_shipment_time_slots/factories'
```

Copyright (c) 2014 Pavel Tarno, released under the New BSD License
