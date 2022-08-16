import os
import helper
import requests
from bs4 import BeautifulSoup


links = helper.getLinks()
print("getting links...")

for link in links:
	print(link.get_text())

# helper.writeFile(links)

print("done.")