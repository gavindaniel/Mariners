from article import Article
import os
import requests
from bs4 import BeautifulSoup
from datetime import datetime, timedelta
from zoneinfo import ZoneInfo


# convert UTC time to PDT
def convert_time(datetime_input):
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
def fix_quotes(line_text):
    new_line = line_text.replace('\"', '\\"')
    return new_line


# add new lines to raw html to make reading easier
def fix_new_lines(line_text):
    new_line = line_text.replace('><', '>\n<')
    return new_line


# get href links from <a> tags
def get_links():
    url = "https://www.espn.com/mlb/team/_/name/sea/seattle-mariners"
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'lxml')
    links = soup.select("a[href*=recap\?gameId]")
    return links


# get headline text
def get_headline(headline):
    if (headline is not None):
        return headline.get_text()
    else:
        return ""


# get time that article was published
def get_time(time):
    if (time is not None):
        temp = convert_time(time.get('data-date'))
        return temp
    else:
        return ""


# get article author
def get_author(author):
    if (author is not None):
        return author.get_text()
    else:
        return ""


# parse XML from href link and create and return an Article object with parsed data
def parse_article(link):
    response = requests.get(link.get('href'))
    soup = BeautifulSoup(response.text, 'lxml')
    headline = soup.find('header', class_="article-header")
    time = soup.select_one("span[data-date]")
    author = soup.find('div', class_="author")
    lines = soup.find_all('p')

    body = ""
    for line in lines:
        temp = fix_quotes(line.get_text())
        temp = fix_new_lines(temp)
        body += temp + "\\\n\\\n"

    article = Article(get_headline(headline), get_time(time), get_author(author), "ESPN", body)

    print("...")

    return article


# create and return a data object for firebase from Article class object
def create_firebase_data(article):
    data = {
        u'title': u"" + article.headline + "",
        u'date': u"" + article.time + "",
        u'author': u"" + article.author + "",
        u'source': u"" + article.source + "",
        u'body': u"" + article.body + ""
    }
    # return data object
    return data


