#Boris Bikes

[Makers Academy](www.makersacademy.com) week 3 assignment, set by [@shadchnev](https://github.com/shadchnev), to replicate the functionality of London's Boris Bikes initiative. The project's goal was introduce students to Object-Oriented Programming and Design while using Test Driven Development.

###Specifications
Bikes should be able to be docked and released from docking stations. Any broken bikes need to be picked up by a van which can drop them at the Garage to be fixed and then take them back to the station once repaired.


###Technologies used

* Ruby
* Test driven development with rspec
* Git version control
* Object-oriented-programming
* CRC (class-responsibility-collaboration) cards.
* Object-orientated design

###Implementaion

The following is a demonstration in ````irb```` of the mock Boris Bikes system.

Dock bikes in the station:

````
station.dock(bike)
=> [#<Bike:0x497g968482a530 @broken=false>]
station.dock(broken_bike)
=> [#<Bike:0x497g968482a530 @broken=false>, #<Bike:0x007f37294837f4 @broken=true>]
station.available_bikes
=> [#<Bike:0x497g968482a530 @broken=false>]
````


Repair bikes at the garage:

````
van.pickup_broken_bikes_from(station)
=> [#<Bike:0x497g968482a530 @broken=true>]
garage.pickup_broken_bikes_from(van)
=> [#<Bike:0x497g968482a530 @broken=true>]
garage.fix_broken_bikes
=> [#<Bike:0x497g968482a530 @broken=false>]
````

Drop off fixed bikes to the station:

````
van.pickup_working_bikes_from(garage)
=> [#<Bike:0x007f37294837f4 @broken=false>]
van.dropoff_working_bikes_to(station)
=> [#<Bike:0x007f37294837f4 @broken=false>]
station.available_bikes
=> [#<Bike:0x007f37294837f4 @broken=false>]
````

![alt text](https://raw.githubusercontent.com/RossHepburn/Boris-Bikes/master/Barclays_Cycle_Hire_bike.jpg   "Boris Bikes")
