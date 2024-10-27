*** Settings ***
Library    SeleniumLibrary
Variables    ../variables/variable.py

*** Keywords ***
I navegate to the login page
    Go To    ${URL_DATA["baseUrl"]}

I input correct credentials
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["correctData"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["correctData"]["password"]} 

I input wrong credentials
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["wrongData"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["wrongData"]["password"]}

I click no the login button
    Click Button    id=login-button 

I able view the home page
    ${Location}    Get Location
    ${full_url}    Catenate    SEPARATOR=    ${URL_DATA["baseUrl"]}    ${URL_DATA["inventoryUrl"]}
    Should Be Equal    ${Location}    ${full_url}

I am able to see expected error message for no credentials
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGE["noCredentials"]}

I am able to see expected error message for no username
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGE["noUsername"]}

I am able to see expected error message for no password
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGE["noPassword"]}

I am able to see expected error message for wrong credentials
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGE["wrongCredentials"]}
I input only the username
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["correctData"]["username"]}

I input only the password
    Wait Until Element Is Visible    id=user-name
    Input Text    id=password    ${LOGIN_DATA["correctData"]["password"]}

I input no credentials
    Wait Until Element Is Visible    id=user-name
