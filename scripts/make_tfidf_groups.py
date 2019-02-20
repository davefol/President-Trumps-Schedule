import sys
import json
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans

if __name__ == '__main__':
    if len(sys.argv) != 2: print "ERROR: Takes 1 argument: number of groups"

    data = json.load(sys.stdin) # Read in json from pipe

    vectorized_data = TfidfVectorizer().fit_transform([entry["event"] for entry in data]) #vectorize event values in Term frequency - inverse document frequency manner

    # cluster based on tf-idf vectors and label 
    labeled_data = [{"event":entry["event"], "time":entry["time"], "duration":entry["duration"], "kgroup":int(label)} for entry, label in zip(data, KMeans(n_clusters = int(sys.argv[1])).fit(vectorized_data).labels_)]

    print json.dumps(labeled_data) # Write the data out
