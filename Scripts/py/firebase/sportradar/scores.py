#
# scores.py
#

#import
import DayBoxscore
import keys
import requests
# import firebase
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# main

year = "2022"
month = "09"
day = "13"

# create the credentials to access database 
cred = credentials.Certificate("serviceAccountKey.json")

# create the app 
app = firebase_admin.initialize_app(cred)

# create the database
db = firestore.client()

#create the batch
batch = db.batch()

# create the data to be added
url = "http://api.sportradar.us/mlb/trial/v7/en/games/"+year+"/"+month+"/"+day+"/boxscore.json?api_key=" + keys.sport_radar
response = requests.get(url)
data = response.json()

# create reference
# scores_ref = db.collection(u'boxscores').document(u"" + year + "-" + month + "-" + day + "")

# set batch to update with data
# batch.update(scores_ref, data)
# batch.set(scores_ref, data)


doc_ref = db.collection(u'boxscores').document(u"" + year + "-" + month + "-" + day + "")

doc = doc_ref.get()

if doc.exists:
    # print(f'Document data: {doc.to_dict()}')
    print("Document exists. Updating...")
    batch.update(doc_ref, data)
else:
    print("No such document! Creating...")
    batch.set(doc_ref, data)


# Commit the batch
batch.commit()

# debug output
print("done.")

