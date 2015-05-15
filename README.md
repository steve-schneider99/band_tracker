Title: Band Tracker

Author: Steve Schneider

Description: Band Tracker allows you to manage bands and venues. It allows you to ad multiple bands, make changes to them or delete them, and integrate them with venues they have visited. It also allows you to add new venues, or associate current venues to bands that have played there before. It has validations for blank entries and also has callbacks to change the entry's title case when it is submitted, but before it is saved to the database.

psql
username=# CREATE DATABASE band_tracker_development; username=# \c band_tracker_development; band_tracker_development=# CREATE TABLE bands (id serial PRIMARY KEY, name varchar); band_tracker_development=# CREATE TABLE venues (id serial PRIMARY KEY, name varchar); band_tracker_development=# CREATE TABLE bands_venues (id serial PRIMARY KEY, band_id int, venue_id int);band_tracker_development=# CREATE DATABASE band_tracker_test WITH TEMPLATE band_tracker_development;

Install Instructions: In order to install and run this app, you will need Sinatra and ActiveRecord. The following gems are needed: 'sinatra', 'sinatra-contrib', 'sinatra-activerecord', 'rake', 'rspec', and 'capybara'.

MIT License: Copyright (c) 2009-2015 Plataformatec http://plataformatec.com.br/

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
