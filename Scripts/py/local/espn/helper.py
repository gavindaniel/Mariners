import os
import requests
from bs4 import BeautifulSoup

from datetime import datetime, timedelta
from zoneinfo import ZoneInfo



def convertTime(datetime_input):
    # Convert to datetime (UTC)
    dt_utc = datetime.strptime(datetime_input, "%Y-%m-%dT%H:%M:%S%z")
    # Convert to PST
    dt_pst = dt_utc.astimezone(ZoneInfo('US/Pacific'))
    # Subtract 12 hours
    # dt = dt_pst - timedelta(hours=12)
    # Change format
    dt_output = dt_pst.strftime("%m/%d/%Y %I:%M %p %Z")
    # return new string
    return(dt_output)


# fix escaping quotes for JSON
def fixQuotes(line_text):
    new_line = line_text.replace('\"', '\\"')
    return(new_line)


# get href links from <a> tags
def getLinks():
    url = "https://www.espn.com/mlb/team/_/name/sea/seattle-mariners"
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'lxml')
    links = soup.select("a[href*=recap\?gameId]")
    return links


def writeTextFile(lines):
    dir_name = '/Users/gavindaniel/Documents/Desktop/github.nosync/Mariners/Scripts/py/output/'
    base_filename = 'output.txt'
    file_name = os.path.join(dir_name, base_filename)

    with open(file_name, 'w') as f :

        for line in lines:
            temp = line.get_text() + "\n\n"
            f.write(temp)


# write a json output file for articles from ESPN using provided parameters
def writeFile(links):
    dir_name = '/Users/gavindaniel/Documents/Desktop/github.nosync/Mariners/Mariners/Resources/'
    base_filename = 'articleData.json'
    file_name = os.path.join(dir_name, base_filename)

    with open(file_name, 'w') as f :
        f.write("[\n")

        for index, link in enumerate(links):
            response = requests.get(link.get('href'))
            soup = BeautifulSoup(response.text, 'lxml')
            headline = soup.find('header', class_="article-header")
            time = soup.select_one("span[data-date]")
            author = soup.find('div', class_="author")
            lines = soup.find_all('p')

            json = writeJSON(index, headline, time, author, lines)
            f.write(json)

            if not index: # only do this for the first article
                writeTextFile(lines)

            print("...")
        # close JSON file
        f.write("\n]")



def writeJSON(index, headline, time, author, lines):
    json = ""
    if not index:
        json += "\t{\n"
    else:
        json += ",\n\t{\n"

    if (headline is not None):
        json += "\t\t\"id\": \"" + str(index+1) + "\",\n"
        json += "\t\t\"title\": \"" + headline.get_text() + "\",\n"
        
        if (time is not None):
            temp = convertTime(time.get('data-date'))
            json += "\t\t\"date\": \"" + temp + "\",\n"
        
        if (author is not None):
            json += "\t\t\"author\": \"" + author.get_text() + "\",\n"
        
        json += "\t\t\"source\": \"ESPN\",\n"
        json += "\t\t\"body\": \""

        for line in lines:
            temp = fixQuotes(line.get_text())
            json += temp + "\\n\\n"
        
        json += "\"\n"
        json += "\t}"
    
    else:
        json += "\"\n"
        json += "\t}"
        print("skipped " + str(index+1) + "...")

    return json








# test.py functions

# add \n to raw HTML file to reformat
def addNewLine(read_file_name, write_file_name):
    # print statement for terminal tracking
    print("adding new line to raw HTML file...")

    # Read in the file
    with open(read_file_name, 'r') as file :
        filedata = file.read()

    # Replace the target string
    filedata = filedata.replace('><', '>\n<')

    # Write the file out again
    with open(write_file_name, 'w') as file:
        file.write(filedata)



# read raw HTML file and convert to JSON file that can be imported to XCode
def parseToJSON(read_file_name):
    # print statement for terminal tracking
    print("parsing HTML to JSON...")

    # file to write to
    dir_name = '/Users/gavindaniel/Documents/Desktop/github.nosync/Mariners/Scripts/py/output/'
    base_filename = 'article.json'
    write_file_name = os.path.join(dir_name, base_filename)

    # Read in the file
    with open(read_file_name, 'r') as read_file :
        read_filedata = read_file.read()

    # parse HTML for needed variables
    soup = BeautifulSoup(read_filedata, 'lxml')
    headline = soup.find('header', class_="article-header")
    time = soup.select_one("span[data-date]")
    author = soup.find('div', class_="author")
    lines = soup.find_all('p')

    # call helper to write JSON file
    writeFileJSON(write_file_name, 0, headline, time, author, lines)



# write a json output file for articles from ESPN using provided parameters
def writeObjectJSON(file_name, index, headline, time, author, lines):
    # print statement for terminal tracking
    print("writing JSON object...")

    with open(file_name, 'a') as f :
        # f.write("[\n")

        if not index:
            f.write("\t{\n")
        else:
            f.write(",\n\t{\n")

        if (headline is not None):
            f.write("\t\t\"id\": " + str(index+1) + ",\n")
            f.write("\t\t\"title\": \"" + headline.get_text() + "\",\n")
            if (time is not None):
                f.write("\t\t\"date\": \"" + time.get('data-date') + "\",\n")
            if (author is not None):
                f.write("\t\t\"author\": \"" + author.get_text() + "\",\n")
            f.write("\t\t\"source\": \"ESPN\",\n")
            

            f.write("\t\t\"body\": \"")
            for line in lines:
                f.write(line.get_text() + "\\n\\n") #
            f.write("\"\n")
            f.write("\t}")
            # print statement for terminal tracking
            print("...")
        else:
            f.write("\"\n")
            f.write("\t}")
            print("skipped " + str(index+1) + "...")

        # f.write("\n]")



# write a json output file for articles from ESPN using provided parameters
def writeFileJSON(file_name, index, headline, time, author, lines):
    # print statement for terminal tracking
    print("writing JSON file...")

    with open(file_name, 'w') as f :
        f.write("[\n")

        if not index:
            f.write("\t{\n")
        else:
            f.write(",\n\t{\n")

        if (headline is not None):
            f.write("\t\t\"id\": " + str(index+1) + ",\n")
            f.write("\t\t\"title\": \"" + headline.get_text() + "\",\n")
            if (time is not None):
                f.write("\t\t\"date\": \"" + time.get('data-date') + "\",\n")
            if (author is not None):
                f.write("\t\t\"author\": \"" + author.get_text() + "\",\n")
            f.write("\t\t\"source\": \"ESPN\",\n")
            

            f.write("\t\t\"body\": \"")
            for line in lines:
                f.write(line.get_text() + "\\n\\n") #
            f.write("\"\n")
            f.write("\t}")
            # print statement for terminal tracking
            print("...")
        else:
            f.write("\"\n")
            f.write("\t}")
            print("skipped " + str(index+1) + "...")

        f.write("\n]")



# print <a> tag href links from provided URL HTML data
def printLinks(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'lxml')
    # links = soup.select("a[href*=recap\?gameId]")
    # links = links + soup.select("a[href*=recap\/\_\/gameId]")
    links = soup.select("a[href*=gameId]")

    print() 
    for link in links:
        temp = link.get('href')
        if "https://www.espn.com" not in temp:
            temp = "https://www.espn.com" + temp
        # print(link.get('href')) # Prints all links.
        print(temp)
    print()




