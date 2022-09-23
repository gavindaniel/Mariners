import os
import requests
from bs4 import BeautifulSoup


# print <a> tag href links from provided URL HTML data
def printLinks(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'lxml')
    # links = soup.select("a[href*=recap\?gameId]")
    # links = links + soup.select("a[href*=recap\/\_\/gameId]")
    # links = soup.select("a[title*=Mariners]")
    links = soup.select("a[href*=watch]")

    print(links)

    # print() 
    # for link in links:
    #     temp = link.get('href')
    #     # if "https://www.espn.com" not in temp:
    #     #     temp = "https://www.espn.com" + temp
    #     # print(link.get('href')) # Prints all links.
    #     print(temp)
    # print()


# main
def main():
	# MLB 2022 Highlights Playlist URL
	url = "https://www.youtube.com/playlist?list=PLL-lmlkrmJanUePyXyLusrJGzyGRg-Qj3"

	printLinks(url)

	print("done.")


if __name__ == '__main__':
    main()

#<a 
#	id="video-title" class="yt-simple-endpoint 
#	style-scope ytd-playlist-video-renderer" 
#	href="/watch?v=Cm3Nh4gbY20&amp;list=PLL-lmlkrmJanUePyXyLusrJGzyGRg-Qj3&amp;index=10" 
#	title="Padres vs. Mariners Game Highlights (9/14/22) | MLB Highlights">
#
#	Padres vs. Mariners Game Highlights (9/14/22) | MLB Highlights
#</a>


# video URL example
# https://www.youtube.com/watch?v=Cm3Nh4gbY20

