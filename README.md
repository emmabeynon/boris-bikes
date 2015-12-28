Boris Bikes Challenge
=================
Author: Emma Beynon

Github: https://github.com/emmabeynon

Email: emma.beynon@gmail.com

This is my submission for the Makers Academy Week 1 Challenge: https://github.com/makersacademy/course/blob/master/boris_bikes/0_challenge_map.md

Overview
---------

The client has asked us to build a programme for Boris Bikes; a network of Docking Stations and bikes that anyone can use.  The programme will run all the docking stations, simulate all the bikes and emulate the infrastructure such as vans and repair garages.  

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a person,
So that I can use a bike,
I'd like to get a bike from a docking station.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.

```

Approach
---------
I approached this challenge using the Test-Driven Development process.  The programme has been tested using Rspec, and I have made use of doubles to reduce dependency on other classes.

How to run the programme
-------------------------
1. Launch pry or irb
2. Require './lib/DockingStation.rb'
3. Create as many of the below class instances as you like:
```
> station = DockingStation.new
> bike = Bike.new
> van = Van.new
> garage = Garage.new
```
4. Interacting with the programme:
```
> station.dock(bike) #docks a bike
> station.release_bike #releases an available bike
> station.release_broken_bike #releases a broken bike for van collection
> bike.working? #checks if a bike is working
> bike.report_broken #reports a bike as broken_bikes
> van.load(station) #loads all broken bikes on to the van
> van.deliver(garage) #delivers broken bikes to the garage
> van.collect(garage) #collects fixed bikes from the garage
> van.distribute(station) #distributes fixed bikes to the docking station
> garage.fix #fixes a bike
```

Further Work
----------------
