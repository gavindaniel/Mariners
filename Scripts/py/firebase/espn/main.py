from article import Article
import helper
# firebase import(s)
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
    # create the article object
    ar = helper.getData(link)
    # create id
    date_id = ar.time.replace("/", "-") 
    # create the data to be added
    data = helper.writeDataObject(ar)

    # create reference
    doc_ref = db.collection(u'articles').document(u"" + date_id + "")

    doc = doc_ref.get()

    if doc.exists:
        print("Document exists. Updating...")
        batch.update(doc_ref, data)
    else:
        print("No such document! Creating...")
        batch.set(doc_ref, data)

# Commit the batch
batch.commit()

# debug output
print("done.")



