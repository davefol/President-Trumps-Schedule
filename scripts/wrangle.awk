# wrangle.awk -- Print CSV for President Trump's hourly events
BEGIN {
	OFS = "\t"
	print "date", "time", "duration", "event"
}

/[A-Z][a-z]*, [A-Z][a-z]* [0-9]{1,2}, [0-9]{4}/ {
       	date = $0
}

/^([0-9]{1,2}:[0-9]{1,2} (AM|PM))$|(TBD)/ {
	time = $0
}

/^\([0-9]+.*\)$/ {
	duration = $0
}

/^[A-Z ,:0-9’]+$/{
	event = $0
	if (event != "SCHEDULE OF THE PRESIDENT" && event != "TBD" && event != "RON:" && event !~ /^([0-9]{1,2}:[0-9]{1,2} (AM|PM))$/ ) print date, time, duration, event
}
