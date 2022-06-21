#!/usr/bin/python

import telegram
import time
import sys
import app
import os

global receiver_id

class TelegramBot:

    def __init__(self, token):
        self.token = token
        self.bot = telegram.Bot(token = self.token)
        global receiver_id
        updates = self.bot.getUpdates()
        receiver_id=updates[-1].message.chat_id # 가장 최근에 채팅한 사용자 id 반환
        print(receiver_id)

    def sendMessage(self, chat_id, message):
        self.bot.sendMessage(chat_id = chat_id, text=message) # reciever_id로 채팅 보내기
    
    def alarm(self, dataSet):
        for e in dataSet:
            if e[2] == True:
                print("{} status is on Sale".format(e[0]))
                self.bot.sendMessage(receiver_id, "{} status is on Sale".format(e[0]))
        print("message check")
        time.sleep(3600 * 3)
