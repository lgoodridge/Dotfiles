""" Reserves a University Room for you. """

""" USAGE: python reserve.py <date> <room_1> <room_2> """
""" Example: python reserve.py "1/12" "Frist 307" "Frist 114" """

import time
from os import system
from sys import exit as sys_exit
from sys import argv as args_list
from sys import platform as _platform
from selenium import webdriver
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys


""" CONSTANTS """

URL = "http://www.princeton.edu/uscheduling/schedorrform.html"
DRIVER_PATH = "/Users/Lance/Library/chromedriver"

NAME = "Lance Goodridge"
TELEPHONE = "443-473-1555"
EMAIL = "lanceg@princeton.edu"

START_TIME = "3:00 pm"
END_TIME = "6:00 pm"

ORGANIZATION = "Princeton Quadcopter"
DEPARTMENT = "15200"

EVENT_TITLE = "Princeton Quadcopter Meeting"
NUMBER_OF_GUESTS = 10

AUTO_SUBMIT = True
AUTO_EXIT = True


""" METHOD DEFINITIONS """

# Clicks on an element, provided its xpath
def click_element(xpath):
    element = browser.find_element_by_xpath(xpath)
    element.click()

# Sends keys to an element, provided its xpath
def send_keys_to_element(xpath, keys):
    element = browser.find_element_by_xpath(xpath)
    element.send_keys(keys)


""" CODE """

# First, make sure there are enough arguments
if (len(args_list) != 4):
    print("USAGE: python reserve.py <date> <room_1> <room_2>")
    sys_exit(0)
else:
    print("Starting")

# Get Date and Room Parameters
DATE = args_list[1]
ROOM_1 = args_list[2]
ROOM_2 = args_list[3]

# Open chrome and go to reservation site
browser = webdriver.Chrome(DRIVER_PATH)
browser.set_window_size(1024, 768)
browser.get(URL)

# Fill in 'Section I: Client Information'
NAME_XPATH = "//*[@id='Name']"
TELE_XPATH = "/html/body/table[1]/tbody/tr[5]/td[2]/table[1]/tbody/tr[3]/td[2]/input"
MAIL_XPATH = "/html/body/table[1]/tbody/tr[5]/td[2]/table[1]/tbody/tr[4]/td[2]/input"
ORG_XPATH  = "/html/body/table[1]/tbody/tr[5]/td[2]/table[1]/tbody/tr[5]/td[2]/input"
DEP_XPATH  = "//*[@id='Department']"

send_keys_to_element(NAME_XPATH, NAME)
send_keys_to_element(TELE_XPATH, TELEPHONE)
send_keys_to_element(MAIL_XPATH, EMAIL)
send_keys_to_element(ORG_XPATH, ORGANIZATION)
send_keys_to_element(DEP_XPATH, DEPARTMENT)

# Fill in 'Section II: Event Information '
TITLE_XPATH = "/html/body/table[1]/tbody/tr[5]/td[2]/table[3]/tbody/tr[2]/td[2]/input"
DATE_XPATH  = "//*[@id='Event_Dates']"
START_TIME_XPATH = "//*[@id='Event_Starts']"
END_TIME_XPATH   = "/html/body/table[1]/tbody/tr[5]/td[2]/table[3]/tbody/tr[5]/td[2]/input"
ROOM_1_XPATH = "/html/body/table[1]/tbody/tr[5]/td[2]/table[3]/tbody/tr[7]/td[2]/input"
ROOM_2_XPATH = "//*[@id='Second_Location_Requested']"
NUM_GUESTS_XPATH = "/html/body/table[1]/tbody/tr[5]/td[2]/table[3]/tbody/tr[9]/td[2]/input"
NO_TICKET_ASSIST_XPATH = "/html/body/table[1]/tbody/tr[5]/td[2]/table[3]/tbody/tr[10]/td[2]/input[2]"
NO_PREV_CONTACT_XPATH  = "/html/body/table[1]/tbody/tr[5]/td[2]/table[3]/tbody/tr[11]/td/p[1]/input[2]"

send_keys_to_element(TITLE_XPATH, EVENT_TITLE)
send_keys_to_element(DATE_XPATH, DATE)
send_keys_to_element(START_TIME_XPATH, START_TIME)
send_keys_to_element(END_TIME_XPATH, END_TIME)
send_keys_to_element(ROOM_1_XPATH, ROOM_1)
send_keys_to_element(ROOM_2_XPATH, ROOM_2)
send_keys_to_element(NUM_GUESTS_XPATH, NUMBER_OF_GUESTS)

click_element(NO_TICKET_ASSIST_XPATH)
click_element(NO_PREV_CONTACT_XPATH)

# Fill in the rest of the sections (defaulting to 'No')
NO_PUBLISH_TO_CAL_XPATH = "/html/body/table[1]/tbody/tr[5]/td[2]/table[4]/tbody/tr[4]/td[1]/p[1]/input[2]"
ROOM_AS_IS_XPATH        = "/html/body/table[1]/tbody/tr[5]/td[2]/table[5]/tbody/tr[2]/td[1]/p[2]/input[1]"
NO_EVENT_PARKING_XPATH  = "/html/body/table[1]/tbody/tr[5]/td[2]/table[8]/tbody/tr[2]/td/input[2]"

click_element(NO_PUBLISH_TO_CAL_XPATH)
click_element(ROOM_AS_IS_XPATH)
click_element(NO_EVENT_PARKING_XPATH)

# Submit the request (if asked to)
if (AUTO_SUBMIT):
    SUBMIT_XPATH = "/html/body/table[1]/tbody/tr[5]/td[2]/p[16]/input[1]"
    click_element(SUBMIT_XPATH)

# Exit peacefully (if asked to)
if (AUTO_EXIT):
    browser.quit()
    sys_exit(0)
