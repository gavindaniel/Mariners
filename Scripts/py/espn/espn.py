import os
import helper
import requests
from bs4 import BeautifulSoup


links = helper.getLinks()

helper.writeFile(links)

print("done.")