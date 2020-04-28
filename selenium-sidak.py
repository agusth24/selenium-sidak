# -*- coding: utf-8 -*-
"""
Created on Fri Apr 17 20:07:19 2020

@author: ROG-GL553VD
"""

from selenium import webdriver

driver = webdriver.Chrome()
driver.implicitly_wait(30)
driver.get("https://sidak.unmul.ac.id/")
driver.find_element_by_name("username").send_keys("your_username")
driver.find_element_by_name ("password").send_keys("your_password")
driver.find_element_by_id("kt_login_signin_submit").click()
driver.find_element_by_css_selector('.swal2-container > .swal2-popup > .swal2-actions > .swal2-confirm').click()

#button_signout = WebDriverWait(driver, 10).until(ec.element_to_be_clickable((By.ID, "signout")))
#button_signout.click()

driver.implicitly_wait(30)
driver.get("https://sidak.unmul.ac.id/home")
driver.find_element_by_class_name("kt-header__topbar").click()
driver.find_element_by_id("signout").click()
driver.find_element_by_css_selector('.swal2-container > .swal2-popup > .swal2-actions > .swal2-confirm').click()

driver.quit()
