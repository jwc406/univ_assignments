#-*- coding: utf-8 -*-

import argparse
import subprocess
import requests
import lxml
import time
import sys
import os
from requests_html import HTMLSession
from flask import Flask, jsonify, request
from flask import render_template
from flask import redirect, url_for
from telegram_bot import TelegramBot
from elasticsearch import Elasticsearch
from selenium import webdriver
from urllib.parse import quote_plus
import chromedriver_autoinstaller

app = Flask(__name__)

chrome_TF = 'google-chrome-stable_current_amd64.deb'
# 셀레니움, 크롬 설치
os.system("pip3 install selenium")
os.system("pip3 install chromedriver_autoinstaller")
os.system("sudo apt update")
os.system("sudo apt upgrade")
os.system("sudo apt install wget")

if os.path.exists(chrome_TF):
    print('chrome already installed')
else:
    os.system("wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb")
    os.system("sudo dpkg -i google-chrome-stable_current_amd64.deb")

os.system("pip3 install elasticsearch")
os.system("pip3 install requests_html")

es_host = "http://localhost:9200"
es = Elasticsearch(es_host)

chrome_ver = chromedriver_autoinstaller.get_chrome_version().split('.')[0]
driver_path = chrome_ver+'/chromedriver'
if os.path.exists(driver_path):
    print(f"chrom driver is insatlled: {driver_path}")
else:
    print(f"install the chrome driver(ver: {chrome_ver})")
    chromedriver_autoinstaller.install(True)

global urlNike
global urlNewB
global urlVans
global brandName

global dataSet
dataSet=[]  #크롤링한 데이터 쌓이는 리스트, 0th idx에 제품이름, 2nd idx에 제품 이미지, 3rd idx에 제품 유뮤(True가 재고 존재)

global flag

token = "5474030501:AAFk4A_nSSWLBxM1oUL4RmDId17KoLUVoNQ"
bot = TelegramBot(token)

@app.route('/')
def index():
        return redirect(url_for('home'))

@app.route('/home')
def home():
        return render_template('home.html')

@app.route('/main', methods=['GET', 'POST'])
def introduce():
        return render_template('main.html')

@app.route('/option1', methods=['GET', 'POST'])
def inputURL_html():
    if request.method == 'POST':    # dataSet 편집시 체크한데이터 삭제
        try:
            checked = request.form.getlist('checklist')
        except:
            print("except")

        for i in checked:
            for j in dataSet:
                if j[0] == i :
                    dataSet.remove(j)

    return render_template('inputURL1.html', parsed_page={})

@app.route('/option2', methods=['GET', 'POST'])
def inputURL2_html():
    if request.method == 'POST':    # dataSet 편집시 체크한데이터 삭제
        try:
            checked = request.form.getlist('checklist')
        except:
            print("except")

        for i in checked:
            for j in dataSet:
                if j[0] == i :
                    dataSet.remove(j)

    return render_template('inputURL2.html', parsed_page={})

@app.route('/option3', methods=['GET', 'POST'])
def inputURL3_html():
    if request.method == 'POST':    # dataSet 편집시 체크한데이터 삭제
        try:
            checked = request.form.getlist('checklist')
        except:
            print("except")

        for i in checked:
            for j in dataSet:
                if j[0] == i :
                    dataSet.remove(j)

    return render_template('inputURL3.html', parsed_page={})

def make_url(search_term):
    base_url = 'https://www.styleshare.kr/search/result?keyword='
    style_tab = '&tab=style'
    return base_url + search_term + style_tab

def crawl_images(itemName):
    search_term = itemName

    # URL 생성
    url = make_url(search_term)

    # 창 숨기는 옵션 추가
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument('--disable-dev-shm-usage')
    chrome_options.add_argument('--start-fullscreen')
    chrome_options.add_argument('--window-size=1920x1080')

    # chrome 브라우저 열기
    browser = webdriver.Chrome(driver_path, chrome_options=chrome_options)
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

def searchItemCody(itemName):
    global brandName
    global dataSet
    imgLst = crawl_images(itemName)

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

@app.route('/info1', methods=['POST']) # URL 크롤링
def parsedInfo1_html():
    if request.method == 'POST':
        itemName = nikeCrwal(dataSet)
        searchItemCody(itemName)
        data = getData(itemName)
        return render_template('inputURL1.html', parsed_page=data['_source'])

@app.route('/info2', methods=['POST']) # URL 크롤링
def parsedInfo2_html():
    if request.method == 'POST':
        itemName = newBCrawl(dataSet)
        searchItemCody(itemName)
        data = getData(itemName)
        return render_template('inputURL2.html', parsed_page=data['_source'])

@app.route('/info3', methods=['POST']) # URL 크롤링
def parsedInfo3_html():
    if request.method == 'POST':
        itemName = vansCrawl(dataSet)
        searchItemCody(itemName)
        data = getData(itemName)
        return render_template('inputURL3.html', parsed_page=data['_source'])

@app.route('/notifyer') # 텔레그램봇 실행
def notifyer():
    global flag
    flag = True
    while flag:
        print(flag)
        stockChecking(dataSet)
        bot.alarm(dataSet)
        time.sleep(5)
    return 'X'

@app.route('/quit') #텔레그램봇 종료
def quit():
    global flag
    flag=False
    print(flag)
    return '알림종료'

@app.route('/edit', methods=['POST']) # 데이터 선택 삭제 페이지 이동
def dataSetedit():
    return render_template('dataEdit.html', dataSet=dataSet)


def stockChecking(dataSet): # 전체 크롤링
    nikeCrwal(dataSet)
    newBCrawl(dataSet)
    vansCrawl(dataSet)

def nikeCrwal(dataSet): #나이키 크롤링
    global brandName

    try:
        urlNike = request.form[u'urlNike']
    except:
        return

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
        return

    dataSet.append(e)
    #dataSet.append(itemStockSize)

    return itemName

def newBCrawl(dataSet): #뉴발란스 크롤링
    global brandName
    try:
        urlNewB = request.form[u'urlNewB']
    except:
        return

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
        return

    dataSet.append(e)
    #dataSet.append(itemStockSize)

    return itemName

def vansCrawl(dataSet): # 반스 크롤링
    global brandName
    try:
        urlVans = request.form[u'urlVans']
    except:
        return

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
        return

    dataSet.append(e)
    #dataSet.append(itemStockSize)
    return itemName

if __name__=='__main__':
    try:
        parser = argparse.ArgumentParser(description="")
        parser.add_argument('--listen-port', type=str, required=True, help='REST service listen port')
        args = parser.parse_args()
        listen_port = args.listen_port
    except Exception as e:
        print('Error: %s' % str(e))
