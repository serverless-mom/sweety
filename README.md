# Sweety - Requirements

Sweety is a simple web application which enables a user to input and 
track blood glucose readings and view reports on those readings.

## Users

The typical user of the Sweety application is a diabetes patient who is 
checking his or her blood glucose levels several times a day. These 
individuals are looking for a method to keep track of their readings 
on a daily basis and examine monthly trends.

In the future, doctors may also have access to this application to 
review patient entered blood glucose levels and review the same daily 
and monthly data.

## Functionality

The applications functionality relates to two core features: entering 
blood glucose level readings and view reports on those readings.

### Data Entry
A user should be able to enter data up to four times per day. Data is 
entered as a single integer value representing blood glucose levels 
(measured in mg/dl). Data should be validated to ensure that a level is 
included in the entry and that there are no more than 4 entries on a given day.

the range for blood glucose readings in mg/dl is between 0 and 400.

### Reports

A user should be able to view reports of their data. There are three 
kinds of reports: daily report, month to date report, and monthly 
report. With a date selector, the user should be able to select the 
end date of the report. For daily reports, data will represent entries 
from that day. For month to date reports, data will start on the first 
of the month for the selected date and end on that date. For monthly 
reports, reports will include data spanning the month the previous monthly period (last 30 days).

Reports should include three data points: a maximum reading from the time 
period, a minimum reading for the time period, and an average of the whole 
data set for the period.

# Setup
1. clone this repo
2. get Ruby and Bundler working on your system
2. `bundle install`
3. Install and start Postgres
4. configure config/database.yml with a username and more useful DB name
5. Start as normal with `rails server`

## Some decisions I made
* in this test version, the user will be able to set an arbitrary date for data entry. The production version will probably default to 'today' with an option to fill in the last few days, but this will depend on stakeholder requirements
* If the UI is very strict, we might use created_at to base our reports, but since we're not doing that I'm using the somewhat-awkwardly-named  `date_measured` column
* Rails validations don't guarantee security/validity, but since the only route available will be to *enter* blood glucose values, this doesn't seem like a major concern. It's hard to imagine the goal of someone maliciously adding invalid glucose values, so I won't do any fancy MySQL-layer constraints
* Devise to validate users. 


## Technology

Rails, MySQL, and Bootstrap. Testing with Minitest

## stuff I did because this is a 'work sample'
* commits are not squashed. I so wish that the first time I commited 'authentication working' that authentication was always working, but I wanted to give you, dear reader, an accurate sense of my process. Therefore the commit history is intact
* the DB config has no password, a terrible idea even if your local doesn't have 'real' production data

# TODO
* 'last month' reporting just takes 'today' as the end date, the next version should have a page before 'reports' where you select a date range.