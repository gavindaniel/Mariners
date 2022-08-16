import os
import helper
import requests
from bs4 import BeautifulSoup

url = "https://www.seattletimes.com/sports/mariners/"
response = requests.get(url)
soup = BeautifulSoup(response.text, 'lxml')

# html = soup.find('div', class_="layout__column layout__column--2")
html = soup.find('body')

dir_name = '/Users/gavindaniel/Documents/Desktop/github.nosync/Mariners/Scripts/html/espn/'
raw_base_filename = 'raw.html'
raw_file_name = os.path.join(dir_name, raw_base_filename)
parse_base_filename = 'espn.html'
parse_file_name = os.path.join(dir_name, parse_base_filename)

print()
# Write the file
with open(raw_file_name, 'w') as file:
	print("writing raw HTML file...")
	file.write(str(html))

# call helper to add \n to raw HTML
helper.addNewLine(raw_file_name, parse_file_name)

# call helper to parse raw HTML to JSON file
helper.parseToJSON(raw_file_name)

# print statement for terminal tracking
print("done")