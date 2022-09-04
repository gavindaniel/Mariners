import helper
# import firebase
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# create the credentials to access database 
cred = credentials.Certificate("serviceAccountKey.json")

# create the app 
app = firebase_admin.initialize_app(cred)

# create the database
db = firestore.client()

# get game recap links
links = helper.getLinks()

#create the batch
batch = db.batch()

# Set the data for article(s)
for index, link in enumerate(links):
    # create reference
    news_ref = db.collection(u'articles').document(u"" + str(index) + "")
    # create the data to be added
    data = helper.getData(link)
    # add data to batch
    batch.set(news_ref, data)

# Delete All
# for index, link in enumerate(links):
#     delete_ref = db.collection(u'articles').document(u"" + str(index) + "")
#     batch.delete(delete_ref)


# Commit the batch
batch.commit()

# debug output
print("done.")



