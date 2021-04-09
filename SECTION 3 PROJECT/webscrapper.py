import pandas as pd 
from bs4 import BeautifulSoup
from selenium import webdriver
import time 


url1 = 'https://www.takealot.com/russell-hobbs-2200w-crease-control-iron/PLID34147865'


def takealotScrapper(url):
    driver = webdriver.Chrome(executable_path="C:/Users/nssatrustee3/Documents/PYTHON_DEV/Webscrapper/chromedriver.exe")
    driver.get((url))
    time.sleep(10)
    
    finalResult = {
        'price': '',
        'availability': '',
        'nextOffer': {
            'price' : '',
            'seller': ''
        }
    }
    mainProduct = {}
    nextProduct = {}

    #main product
    priceResults = driver.find_elements_by_xpath('//div[@class="buybox-module_price_2YUFa"]')
    availabilityResults = driver.find_elements_by_xpath('//div[@class="cell shrink stock-availability-status"]')

    #expand next product.
    driver.find_element_by_xpath('//div[@class="collapsible is-closed override-trigger"]').click()
    time.sleep(10)

    #find next products collapsible is-open override-trigger
    nextProducts = driver.find_elements_by_xpath('//div[@class="collapsible is-open override-trigger"]') 

    #main product
    for priceResult in priceResults:
        price = priceResult.text 
        #print('main product price is',price)
        finalResult["price"] = price

    for availabilityResult in availabilityResults:
        availability = availabilityResult.text 
        #print('main product availability is',availability)
        finalResult["availability"] = availability

    #next offer product
    #print(len(nextProducts))
    #print(nextProducts)
    for product in nextProducts: 
        #WORKS
        product1 = product.find_element_by_xpath('//div[@class="buying-choice-list-item buying-choice-list-item-module_buying-choice-list-item_1TaEB"]')
        #print('prod 1 is:', product1.text)
        #print('prod is price is', product1.text.splitlines()[0] )
        finalResult["nextOffer"]["price"] = product1.text.splitlines()[0]
        #print('prod is seller is', product1.text.splitlines()[-1] )
        finalResult["nextOffer"]["seller"] = product1.text.splitlines()[-1]

    return finalResult


print(takealotScrapper(url1))


