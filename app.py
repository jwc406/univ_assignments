#!/usr/bin/python

import argparse
import subprocess
import requests
import time
from requests_html import HTMLSession
from flask import Flask, jsonify, request
from flask import render_template
# from telegram_bot import TelegramBot
import telegram
from elasticsearch import Elasticsearch
from selenium import webdriver
from urllib.parse import quote_plus

app = Flask(__name__)

es_host = "http://localhost:9200"
es = Elasticsearch(es_host)

global urlNike
global urlNewB
global urlVans
global brandName

global dataSet
dataSet=[]

token = "5474030501:AAFk4A_nSSWLBxM1oUL4RmDId17KoLUVoNQ"
bot = telegram.Bot(token)
receiver_id = "1384253707"


def make_url(search_term):
    base_url = 'https://www.styleshare.kr/search/result?keyword='
    return base_url + quote_plus(search_term)

@app.route('/crawl_images/')
def crawl_images(search_term):
    search_term = request.args.get('tag')

    # URL 생성
    url = make_url(search_term+'코디')

    # 창 숨기는 옵션 추가
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument('--disable-dev-shm-usage')
    chrome_options.add_argument('--start-fullscreen')
    chrome_options.add_argument('--window-size=1920x1080')

    # chrome 브라우저 열기
    browser = webdriver.Chrome('chromedriver', chrome_options=chrome_options)
    browser.implicitly_wait(3)  # 브라우저를 오픈할 때 시간간격을 준다.
    browser.get(url)

    # 이미지 크롤링
    images = browser.find_elements_by_class_name("Image__StyledImg-leMOHc")

    link_images = []

    for img in images[:10]:
        link_images.append(img.get_attribute('src'))

    print(link_images)

    # 마무리
    print(search_term + " 크롤링 성공")
    browser.quit()

    return link_images

@app.route('/')
def inputURL_html():
    return render_template('inputURL.html')

@app.route('/info', methods=['POST'])
def parsedInfo_html():
    global dataSet
    if request.method == 'POST':
        itemName = stockCheckingAndSaveData(dataSet)
        searchItemCody(itemName)
        data = getData(itemName)
        return render_template('parsedInfo.html', parsed_page=data['_source'])

@app.route('/notifyer')
def notifyer():
    while True:
        for e in dataSet:
            if e[2] == True:
                bot.sendMessage(receiver_id, "{} status is on Sale".format(e[0]))
        print("message check")
        time.sleep(10)

def searchItemCody(itemName):
    global brandName
    global dataSet
    # imgLst = crawl_images(itemName)

    imgLst = [
        "https://www.styleshare.kr/young0e24/174502140?previous_screen=search_result_overall",
        "https://www.styleshare.kr/_d2_n4/174502059?previous_screen=search_result_overall",
        "https://www.styleshare.kr/lonelyj33/174501573?previous_screen=search_result_overall",
        "https://www.styleshare.kr/wndms9710/174473405?previous_screen=search_result_style",
        "https://www.styleshare.kr/jeenny99/174409139?previous_screen=search_result_style",
        "https://www.styleshare.kr/hanm1231/174415304?previous_screen=search_result_style",
        "https://www.styleshare.kr/hanm1231/174456312?previous_screen=search_result_style",
        "https://www.styleshare.kr/ud2020/174498821?previous_screen=search_result_style"
    ]

    doc = {
        'itemName': dataSet[len(dataSet) - 1][0],
        'itemImg': dataSet[len(dataSet) - 1][1],
        'itemStock': dataSet[len(dataSet) - 1][2],
        'itemCodyImgLst': imgLst
    }

    try:
        res = es.update(index=brandName, id=itemName, body=doc)
    except:
        res = es.index(index=brandName, id=itemName, body=doc)

    return res

def getData(itemName):
    global brandName

    query = {
        "query": {
            "bool": {
                "must": [
                    {
                        "match": {
                            "itemName": itemName
                        }
                    }
                ]
            }
        }
    }

    data = es.get(index=brandName, id=itemName, body=query)
    return data

def stockCheckingAndSaveData(dataSet):
    if nikeCrwal(dataSet):
        itemName = dataSet[len(dataSet) - 1][0]

    if newBCrawl(dataSet):
        itemName = dataSet[len(dataSet) - 1][0]

    if vansCrawl(dataSet):
        itemName = dataSet[len(dataSet) - 1][0]

    return itemName, dataSet

def nikeCrwal(dataSet):
    global brandName

    try:
        urlNike = request.form[u'urlNike']
    except:
        return False

    brandName = "nike"
    print("Crawling initiating")
    session = HTMLSession()
    r = session.get(urlNike)
    #r.html.render(sleep=1, keep_page=True)

    itemName = r.html.find('span.tit')[0].text
    itemImg = r.html.find('div.prd-gutter>img')[4]
    itemImg = itemImg.attrs['src']
    itemStock = r.html.find('span.comming')[0].text

    if(itemStock=="상품이 품절되었습니다."):    #품절되면 False
        itemStock=False
    else:
        itemStock=True

    #itemStockSize = r.html.find('span.input-radio')   #사이즈별로 재고 불러오기 구현 X
    e = []
    e.append(itemName)
    e.append(itemImg)
    e.append(itemStock)

    if e in dataSet:
        return False

    dataSet.append(e)
    #dataSet.append(itemStockSize)
    return True

def newBCrawl(dataSet):
    global brandName
    try:
        urlNewB = request.form[u'urlNewB']
    except:
        return False

    brandName = "newb"

    print("Crawling initiating")
    session = HTMLSession()
    r = session.get(urlNewB)
    #r.html.render(sleep=1, keep_page=True)

    itemName = r.html.find('h2.title')[0].text
    itemImg = r.html.find('div.inner>img')[0]
    itemImg = itemImg.attrs['src']
    itemStock = r.html.find('#optSizeSection > ul > li > input')

    cnt=0
    for stock in itemStock:
        if 'disabled' in stock.attrs:
            cnt+=1

    if cnt == len(itemStock):
        itemStock = False
    else:
        itemStock = True

    e = []
    e.append(itemName)
    e.append(itemImg)
    e.append(itemStock)

    if e in dataSet:
        return False

    dataSet.append(e)
    #dataSet.append(itemStockSize)
    return True

def vansCrawl(dataSet):
    global brandName
    try:
        urlVans = request.form[u'urlVans']
    except:
        return False

    brandName = "vans"
    print("Crawling initiating")
    session = HTMLSession()
    r = session.get(urlVans)
    #r.html.render(sleep=1, keep_page=True)

    itemName = r.html.find('div.product-summary > h1')[0].text
    itemImg = r.html.find('ul.thumb-wrap>li>a>img')[0]
    itemImg = itemImg.attrs['src']
    itemImg = itemImg[0 : -10]
    itemStock = r.html.find('#wrapper > main > section > div.pdp-container > div.pdp-main.row.flex-no-gutters > div:nth-child(2) > div > div.fixit-element.pdp-info > form > div.product-variations-action > div > div > span')

    if len(itemStock)>0:
        itemStock = False
    else:
            itemStock = True

    e = []
    e.append(itemName)
    e.append(itemImg)
    e.append(itemStock)

    if e in dataSet:
        return False

    dataSet.append(e)
    #dataSet.append(itemStockSize)
    return True

if __name__=='__main__':
    try:
        parser = argparse.ArgumentParser(description="")
        parser.add_argument('--listen-port', type=str, required=True, help='REST service listen port')
        args = parser.parse_args()
        listen_port = args.listen_port
    except Exception as e:
        print('Error: %s' % str(e))
