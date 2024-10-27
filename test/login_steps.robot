*** Settings ***

Resource    ../resources/login_keywords.resource
Suite Setup    Open Browser    browser=chrome


*** Test Cases ***
Successful Login
    I navegate to the login page    
    I input correct credentials    
    I click no the login button
    I able view the home page

Unsuccessful Login - No credentials
    I navegate to the login page    
    I input no credentials
    I click no the login button
    I am able to see expected error message for no credentials

Unsuccessful Login - No username
    I navegate to the login page    
    I input only the password
    I click no the login button
    I am able to see expected error message for no username

Unsuccessful Login - No password
    I navegate to the login page    
    I input only the username
    I click no the login button
    I am able to see expected error message for no password

Unsuccessful Login - Wrong credentials
    I navegate to the login page    
    I input wrong credentials
    I click no the login button
    I am able to see expected error message for wrong credentials