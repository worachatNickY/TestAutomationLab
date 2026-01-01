*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                 Chrome
${URL}                     http://localhost:7272/Lab4/Registration.html
${CHROME_BROWSER_PATH}     D:\\nickysoften\\ChromeForTesting\\chrome-win64\\chrome-win64\\chrome.exe
${CHROME_DRIVER_PATH}      D:\\nickysoften\\ChromeForTesting\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe

*** Test Cases ***
TC_003: Empty First Name
    [Documentation]    แสดง error เมื่อไม่กรอก First Name
    Open Registration Page
    Input Text    id=lastname     Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email        somyod@kkumail.com
    Input Text    id=phone        091-001-1234
    Click Button    id=registerButton
    Title Should Be    Registration
    Page Should Contain    Please enter your first name!!
    Close Browser

TC_004: Empty Last Name
    [Documentation]    แสดง error เมื่อไม่กรอก Last Name
    Open Registration Page
    Input Text    id=firstname    Somyod
    Input Text    id=organization    CS KKU
    Input Text    id=email        somyod@kkumail.com
    Input Text    id=phone        091-001-1234
    Click Button    id=registerButton
    Title Should Be    Registration
    Page Should Contain    Please enter your last name!!
    Close Browser

TC_005: Empty First Name And Last Name
    [Documentation]    แสดง error เมื่อไม่กรอกทั้ง First Name และ Last Name
    Open Registration Page
    Input Text    id=organization    CS KKU
    Input Text    id=email        somyod@kkumail.com
    Input Text    id=phone        091-001-1234
    Click Button    id=registerButton
    Title Should Be    Registration
    Page Should Contain    Please enter your name!!
    Close Browser

TC_006: Empty Email
    [Documentation]    แสดง error เมื่อไม่กรอก Email
    Open Registration Page
    Input Text    id=firstname    Somyod
    Input Text    id=lastname     Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=phone        091-001-1234
    Click Button    id=registerButton
    Title Should Be    Registration
    Page Should Contain    Please enter your email!!
    Close Browser

TC_007: Empty Phone Number
    [Documentation]    แสดง error เมื่อไม่กรอก Phone Number
    Open Registration Page
    Input Text    id=firstname    Somyod
    Input Text    id=lastname     Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email        somyod@kkumail.com
    Click Button    id=registerButton
    Title Should Be    Registration
    Page Should Contain    Please enter your phone number!!
    Close Browser

TC_008: Invalid Phone Number Format
    [Documentation]    แสดง error เมื่อกรอก Phone Number ผิดรูปแบบ
    Open Registration Page
    Input Text    id=firstname    Somyod
    Input Text    id=lastname     Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email        somyod@kkumail.com
    Input Text    id=phone        1234
    Click Button    id=registerButton
    Title Should Be    Registration
    Page Should Contain    Please enter a valid phone number
    Close Browser

*** Keywords ***
Open Registration Page
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${URL}
    Title Should Be    Registration
