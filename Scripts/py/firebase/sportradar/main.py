#
# main.py
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

# create the credentials to access database 
cred = credentials.Certificate("serviceAccountKey.json")

# create the app 
app = firebase_admin.initialize_app(cred)

# create the database
db = firestore.client()

#create the batch
batch = db.batch()

# create the data to be added
url = "https://api.sportradar.us/mlb/trial/v7/en/games/2022/09/01/boxscore.json?api_key=" + keys.sport_radar
response = requests.get(url)
data = response.json()
# day_boxscore = DayBoxscore(**data)

# create reference
# boxscore_ref = db.collection(u'boxscores').document(u"" + data.league.id + "")
boxscore_ref = db.collection(u'boxscores').document(u"" + str(1) + "")

# add data to batch
batch.set(boxscore_ref, data)

# Delete All
# for index, link in enumerate(links):
#     delete_ref = db.collection(u'articles').document(u"" + str(index) + "")
#     batch.delete(delete_ref)


# Commit the batch
batch.commit()

# debug output
print("done.")

