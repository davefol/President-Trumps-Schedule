import sys
import csv
import json

def f2(seq): 
   # order preserving
   checked = []
   for e in seq:
       if e not in checked:
           checked.append(e)
   return checked

if __name__ == "__main__":
    # Convert to JSON
    fieldnames = ("date", "time", "duration", "event")
    reader = csv.DictReader(sys.stdin, fieldnames, delimiter = "\t")
    jsondata = [row for row in reader]
    jsondata = f2(jsondata)

    # Consolidate all the duplicates
    signatures = []
    for i,j in enumerate(jsondata):
        # test for signature, skip if found
        if j["date"] + "***" + j["time"] + "***" + j["duration"] in signatures: continue
        signatures.append(j["date"] + "***" + j["time"] + "***" + j["duration"])

        # search for matching signatures and add them
        for jn in jsondata[i+1:]:
            if jn["date"] + "***" + jn["time"] + "***" + jn["duration"]  == j["date"] + "***" + j["time"] + "***" + j["duration"]:
                j["event"] = j["event"] + " " + jn["event"]

        j["time"] = j["date"] + " " + j["time"]
        if j["time"] == "time":
            print "time\tduration\tevent"
        else:
            print "{0:s}\t{1:s}\t{2:s}".format(j["time"], j["duration"], j["event"])
