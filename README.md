# The Bad Intern Reporting In

Due to the bad interns TERRIBLE performance on the development team, they've been transferred to the analytics reporting team. Unfortunately, they have once again managed to completely screw up their reporting jobs.

The client is a movie rental firm and has hired the agency to create reports for their business. The intern's task was to query the database and get the data for the report.

## Setup Instructions

1. Open a terminal and go to the ``source_data`` folder
2. Open the PostgreSQL shell with the command ``psql``
3. Run these commands in the PSQL shell:
    ``CREATE DATABASE pagila;``
    ``\c pagila``
    ``\i pagila-schema.sql``
    ``\i pagila-data.sql``

## Reports and their Problems

### Inventory Value
This report doesn't make any sense. It should show the sum of the replacement value, by store, showing the location's address.

### Inventory Value: Replacement Costs by Actor
This report should show the cost to replace all copies of films by the actor in the film. The purpose of this report to to see what the risk exposure is for loss of films if an actor becomes suddenly popular/unpopular.

The report current crashes when run.

It should have fields:
replacementCosts (the TOTAL replacement value of all pieces in inventory)
films (this is the ID of the film)
actorName (this is the combination of first name and last name)

It should also sort with the most valuable inventory at the top

### Most Prolific Actors
This report is completely missing. The client wants a list of all the actors and the number of movies they are in.

    #### Desired Fields
    films: The total number of films an actor is in
    actorName: This is the combined first and last name of the actor

    #### Notes
    Sort by the actor with the most films

### Revenue by Actor For Month of June 2022
The report's numbers seem far too high for each record. Something is very wrong.

### Overdue Movies
This report has all the right fields but fails to run. It looks like part of the SQL is missing or was skipped.

### Value Overdue
This report seems to be showing bogus information. There are far more movies being listed as overdue than are actually overdue.

### Overdue Value by Category
Oddly, this one appears to be done correctly.

### Top Selling Manager by Rentals
Oddly, this one appears to be done correctly.

### Top manager by revenue
Oddly, this one appears to be done correctly.