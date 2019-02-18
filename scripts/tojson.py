import sys
import csv
import json

if __name__ == "__main__":
    fieldnames = ("time", "duration", "event")
    reader = csv.DictReader(sys.stdin, fieldnames, delimiter = "\t")
    print json.dumps([row for row in reader][1:])
