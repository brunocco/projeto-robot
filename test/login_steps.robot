*** Settings ***

Library    SeleniumLibrary
Resource    ../resources/login_keywords.resource
Suite Setup    Open Browser    browser=chrome

*** Variables ***
${URL}    https://www.saucedemo.com
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Successful Login
    I navegate to the login page    ${URL}
    I input correct credentials    ${USERNAME}    ${PASSWORD}
    I click no the login button
    I able view the home page

Unsuccessful Login - No credentials
    I navegate to the login page    ${URL}
    I input no credentials
    I click no the login button
    I am able to see expected error message    Epic sadface: Username is required

Unsuccessful Login - No username
    I navegate to the login page    ${URL}
    I input only the password    ${PASSWORD}
    I click no the login button
    I am able to see expected error message    Epic sadface: Username is required

Unsuccessful Login - No password
    I navegate to the login page    ${URL}
    I input only the username    ${USERNAME}
    I click no the login button
    I am able to see expected error message    Epic sadface: Password is required

Unsuccessful Login - Wrong credentials
    I navegate to the login page    ${URL}
    I input wrong credentials    ssssss    ssssss
    I click no the login button
    I am able to see expected error message    Epic sadface: Username and password do not match any user in this service