import helper
# import
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# create the credentials to access database 
cred = credentials.Certificate("serviceAccountKey.json")

# create the app 
app = firebase_admin.initialize_app(cred)

# create the database
db = firestore.client()

# create the data to be added
data = {
    u'title': u'Ray\'s Day: Robbie Ray dominant as Mariners top Guardians 4-0',
    u'date': u'08/28/2022 04:13 PM PDT',
    u'author': u'AP',
    u'source': u'ESPN',
    u'body': u'test'
}

# Add a new doc in collection 'articles' with ID '123'
# db.collection(u'articles').document(u'123').set(data)

#create the batch
batch = db.batch()

# Set the data for article(s)
news_ref = db.collection(u'articles').document(u'7')
batch.set(news_ref, data)

news_ref = db.collection(u'articles').document(u'8')
batch.set(news_ref, data)

news_ref = db.collection(u'articles').document(u'9')
batch.set(news_ref, data)

# Update the population for SF
# sf_ref = db.collection(u'cities').document(u'SF')
# batch.update(sf_ref, {u'population': 1000000})

# Delete DEN
# den_ref = db.collection(u'cities').document(u'DEN')
# batch.delete(den_ref)

# Commit the batch
batch.commit()