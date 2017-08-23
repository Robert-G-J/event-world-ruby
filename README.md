# Viagogo Coding Challenge- 'Event-World-Ruby'

This solution has been written in Ruby, prepared for extension with a Postgres database and placed within a Sinatra framework with Rack to serve.

## Installation

1. Clone this repo to your machine:
```
$ git clone https://github.com/Robert-G-J/event-world-ruby.git
```

2. Navigate to the repository:
```
$ cd path/to/repo 
```

3. Install dependencies and run tests:
```
$ bundle install  // install gems
$ rspec 					// check all tests are green
```
### Populating the World
See how the world works so far. Choose a REPL:
```
$ pry (or irb)
```
Require the app file and 
```
> require './app/app.rb'
> world = World.new
> grid_populator = GridPopulator.new
> event_populator = EventPopulator.new
> grid = Grid.new
> grid.extend(GridRandom)
> grid.generate_empty
> world.add_grid(grid)
> world.populate([event_populator, grid_populator])
```
To query for the events closest to a coordinate:
```
> world.list_closest_events([1, 1])
```
## Honesty Up Front
I ran out of time after a solid innings. I have not met the specification, after I hit a roadblock trying to accurately implement the logic required for returning the list of events by Manhattan distance with cheapest ticket.
[Here's what I'd improve and do differently](#Improvements)

## Approach
1. Create classes for Grid, Event and Ticket.
These have been written to be as reusable and uncoupled as possible.

2. Associations: a Grid has Events, Events have Tickets. 
By observing the Single Responsibility Principle, I did not want Events to be able to generate Tickets, or Grids to populate with events.

3. Grid and GridRandom module: I wanted to generate reasonable random values within the x, y boundaries of the Grid. I felt that having these methods to generate random values on the Grid in the class blurred its purpose. They are extracted to the module GridRandom so that they can be used to extend the class if required.

3a. Storing Events in Grid: Events are stored in a hash with a coordinate array as key and the event object as value.

4. Populators: Where Grids, Events and Tickets have the means to be populated, the 'populator' classes are introduced specificially to populate them. This ensures that the objects are extensible, reuseable and reduces 

5. World: The World Class is designed to be the container to house the other classes and have the higher-level methods that interact with the other classes to populate it.

6. Populator logic: The GridPopulator and EventPopulator classes are 'duck' types, which are entrusted by World to prepare a populated Grid and Events with Tickets. 

7. Listing events by Manhattan Distance and cheapest ticket:
World handles this, currently unsuccessfully. More information below.

8. Add Sinatra Framework and Postgres Database with DataMapper: To show that the current architecture is extensible, I have configured the application to be a Sinatra Modular app, ready to be extended forwards. I have also configured a postgres database with DataMapper as the ORM, that the backend can be quickly extended.

## Behaviours
1. **Commit on green, commit often.** Small commits were pushed often, so that changes are easily rolled back or adopted.
2. Commit Messages: Commits are written in the present tense and have a further passage to justify/explain any changes.
3. Prefer London-style testing
4. Use Rubocop as a style guide

## Improvements

I feel that in seeking to make the classes truly have a single responsibilty with little coupling, I have inadvertently overcomplicated my solution.
I would consider instead giving the Grid and Event classes class-methods to handle generating random seed data.
I clearly want to crack the current dilemna of bringing together the event, tickets and location data to render the closest events with ticket prices.

## How might you change your program if you needed to support multiple events at the
same location?
I can change the Grid to generate empty arrays against each coordinate key. Events can be concatenated into these by the GridPopulator,

## How would you change your program if you were working with a much larger world
size?
I carefully considered this before building. The Grid class takes arguments at initialisation to define its range, which makes it simpler to assign.
With regard to search efficiency, I would apply a Big-O analysis of the current search methods and refactor to remove any non-linear code.
I have connected and setup a postgres database with DataMapper as an ORM to show that the existing format can be easily extended.

## User Stories
```
As a user
I want to see events near me
So that I can enjoy free time

As a user
I want to know the cost of those events
So that I can choose which I can afford

As a user
I want to know the distance to an event
So that I can make a decision based on that distance
```
## Assumptions:

- Coordinates are expressed as integers, not floats
- The Manhattan distance is the absolute difference of two coordinates
- There are up to ten Events per grid
- There are up to ten tickets per event
- Tickets are between $30-$50. 

### Technologies
Currently:
- Ruby 2.4.0
- RSpec
- Rubocop
Implemented ready for to extend the project:
- Sinatra
- Postgres
- Rake
- Database_Cleaner


# Requirements
Viagogo Coding Challenge
- Code in any language you like but please provide clear instructions on how we should build & run your code.
- Please use any source control system you like, and send us a link via github or google drive (our email system blocks zip files).
- The first requirement is your code meets the requirements.
- Secondary requirements are whether your code is idiomatic for the language being
coded in, easy to read, and clearly laid out.
## Scenario
- Your program should randomly generate seed data.
- Your program should operate in a world that ranges from -10 to +10 (Y axis), and -10
to +10 (X axis).
- Your program should assume that each co-ordinate can hold a maximum of one event.
- Each event has a unique numeric identifier (e.g. 1, 2, 3).
- Each event has zero or more tickets.
- Each ticket has a non-zero price, expressed in US Dollars.
- The distance between two points should be computed as the Manhattan distance.
## Instructions
- You are required to write a program which accepts a user location as a pair of co- ordinates, and returns a list of the five closest events, along with the cheapest ticket price for each event.
- Please detail any assumptions you have made.
- How might you change your program if you needed to support multiple events at the
same location?
- How would you change your program if you were working with a much larger world
size?
### Example Program Run
Please Input Coordinates: > 4,2
Closest Events to (4,2):
Event 003 - $30.29, Distance 3 Event 001 - $35.20, Distance 5 Event 006 - $01.40, Distance 12