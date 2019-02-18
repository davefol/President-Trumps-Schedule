import sys
import json
import re
import datetime

def to_minutes(s):
    s = s[1:-1] # strip of parenthesis
    try:
        hours = int(re.search("[1-9][0-9]* hr", s).group()[:-2])
    except AttributeError:
        hours = 0

    try:
        minutes = int(re.search("[1-9][0-9]* min", s).group()[:-3])
    except AttributeError:
        minutes = 0

    hours = hours if hours else 0
    minutes = minutes if minutes else 0
    minutes = minutes + (hours * 60)
    return minutes

def to_date_time(d,t):
    weekday, month, day, year = d.split()


if __name__ == "__main__":
    data = json.load(sys.stdin)
    for val in data:
        val["duration"] = to_minutes(val["duration"])
        # val["time"] = to_date_time(val["date"], val["time"])
        
    print json.dumps(data)
