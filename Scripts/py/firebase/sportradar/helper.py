import article
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
    return new_line


def fixNewLines(line_text):
    new_line = line_text.replace('><', '>\n<')
    return new_line


# get href links from <a> tags
def getLinks():
    url = "https://www.espn.com/mlb/team/_/name/sea/seattle-mariners"
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'lxml')
    links = soup.select("a[href*=recap\?gameId]")
    return links


# write a json output file for articles from ESPN using provided parameters
def getData(link):
    response = requests.get(link.get('href'))
    soup = BeautifulSoup(response.text, 'lxml')
    headline = soup.find('header', class_="article-header")
    time = soup.select_one("span[data-date]")
    author = soup.find('div', class_="author")
    lines = soup.find_all('p')

    data = writeDataObject(headline, time, author, lines)

    print("...")

    return data


def getHeadline(headline):
    if (headline is not None):
        return headline.get_text()
    else:
        return ""


def getTime(time):
    if (time is not None):
        temp = convertTime(time.get('data-date'))
        return temp


def getAuthor(author):
    if (author is not None):
        return author.get_text()


def writeDataObject(headline, time, author, lines):
        body = ""
        for line in lines:
            temp = fixQuotes(line.get_text())
            temp = fixNewLines(temp)
            body += temp + "\\\n\\\n"

        data = {
            u'title': u"" + getHeadline(headline) + "",
            u'date': u"" + getTime(time) + "",
            u'author': u"" + getAuthor(author) + "",
            u'source': u'ESPN',
            u'body': u"" + body + ""
        }

        # city = City(title=u'Los Angeles', state=u'CA', country=u'USA')


        return data









