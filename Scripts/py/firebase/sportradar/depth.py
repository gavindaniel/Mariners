#
# depth.py
#
# get depth chart for all teams in the American & National League
#

#import custom libraries
from config import API_KEY
# import python libraries
import requests
# import firebase libraries
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# main
def main():
    # create the credentials to access database 
    cred = credentials.Certificate("../serviceAccountKey.json")

    # create the app 
    app = firebase_admin.initialize_app(cred)

    # create the database
    db = firestore.client()

    #create the batch
    batch = db.batch()

    # create the data to be added
    url = f'https://api.sportradar.us/mlb/trial/v7/en/league/depth_charts.json?api_key={API_KEY}'
    response = requests.get(url)
    data = response.json()

    # create reference
    doc_ref = db.collection(u'depth').document(u"mlb")

    # try to get the document using the reference
    doc = doc_ref.get()

    # check if the document exists
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


if __name__ == '__main__':
    main()

