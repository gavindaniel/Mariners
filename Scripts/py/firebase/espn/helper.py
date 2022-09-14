from article import Article
import os
import requests
from bs4 import BeautifulSoup
from datetime import datetime, timedelta
from zoneinfo import ZoneInfo

date = ""

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


def getDate(dt_input):
    # Change format
    # dt_output = dt_input.strftime("%m-%d-%Y---%I:%M")
    dt_output = datetime.strptime(dt_input, '%m/%d/%Y %I:%M %p %Z').strftime('%m-%d-%Y---%I:%M')
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

# # get time id for link
# def getTimeID(link):

# write a json output file for articles from ESPN using provided parameters
def getData(link):
    response = requests.get(link.get('href'))
    soup = BeautifulSoup(response.text, 'lxml')
    headline = soup.find('header', class_="article-header")
    time = soup.select_one("span[data-date]")
    author = soup.find('div', class_="author")
    lines = soup.find_all('p')

    article = writeArticle(headline, time, author, lines)

    print("...")

    return article


def getHeadline(headline):
    if (headline is not None):
        return headline.get_text()
    else:
        return ""


def getTime(time):
    if (time is not None):
        temp = convertTime(time.get('data-date'))
        # date = temp
        return temp


def getAuthor(author):
    if (author is not None):
        return author.get_text()


def writeArticle(headline, time, author, lines):
    body = ""
    for line in lines:
        # temp = line.get_text()
        temp = fixQuotes(line.get_text())
        temp = fixNewLines(temp)
        body += temp + "\\\n\\\n"
        # body += temp + "\n\n"

    # article = {
    #     u'title': u"" + getHeadline(headline) + "",
    #     u'date': u"" + getTime(time) + "",
    #     u'author': u"" + getAuthor(author) + "",
    #     u'source': u'ESPN',
    #     u'body': u"" + body + ""
    # }

    # article = Article(title=u"" + getHeadline(headline) + "", date=u"" + getTime(time) + "", author=u"" + getAuthor(author) + "", source=u'ESPN', body=u"" + body + "")
    article = Article(getHeadline(headline), getTime(time), getAuthor(author), "ESPN", body)
    # print(article.time)

    return article


def writeDataObject(article):
    data = {
        u'title': u"" + article.headline + "",
        u'date': u"" + article.time + "",
        u'author': u"" + article.author + "",
        u'source': u"" + article.source + "",
        u'body': u"" + article.body + ""
    }

    return data


