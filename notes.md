% Visualization of Trump's Leaked Schedule
% David Folarin and Allison Coomber
% February 16, 2019

# Things to Add
* Markers for tweet
* Hover for description
* Top news item at time

# Grouping Events and Assinging Color
* grep for food (lunch, dinner, breakfast, etc)
* grep for meeting
* grep for media, photo
* grep for remarks?
* policy time / executive time get there own color

# Hints for listing the events belonging to each kmeans group
## Using various utilties
* install jq to manipulate json files
	* jq can be hard to get at first but its actually pretty similar to bash
	* you'll need the @tsv filter if you want to pipe the output of jq to something that understands tsv
* use sort and some other utility to add headers (need to sort by kgroup, -k2 will sort by the second column for example)

## using a scripting language
* python: json library and list comprehensions
* ruby, perl, etc. have their own json libraries

## Using awk
* After converting to csv, you can select the column using $1, $2, $3, etc. 
* asign each row to a list of lists
* You can use END instead of a regex to specify things that occur at the end
