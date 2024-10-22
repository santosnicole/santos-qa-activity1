*** Settings ***
# import pre-made and custom libraries
Library    SeleniumLibrary
Resource    ../Resources/SampleResource.resource
Variables    ../Variables/variable.py

Suite Teardown    Close Browser
Test Teardown    Close Browser

Suite Setup
Test Setup
*** Variables ***
${age}    17
${remote_url}     http://10.127.132.43:4444
*** Test Cases ***
Logging Variables
    # Display Age
    # Log To Console    ${uname}
    # Log To Console    ${passwd}
    # Add Two Numbers    4323    389438
    # Concatenate    hello    lovegoodbye
    # Log Range
    # Perform if else    7

    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Open Browser    https://google.com    chrome    remote_url=${remote_url}    options=${chrome_options}
*** Keywords ***


Display Age
    Log To Console    ${age}
Add Two Numbers
    [Arguments]    ${num1}    ${num2}
    ${sum}    Evaluate    ${num1}+${num2}
    Log To Console    ${sum}

Concatenate
    [Arguments]    ${str1}    ${str2}=DefaultValue
    ${twostrings}    Set Variable    ${str1} ${str2}
    ${concatenated}    Evaluate    "${str1}" + " " + "${str2}"
    Log To Console    ${twostrings}
    Log To Console    ${concatenated}

# Log Digits
#     @{digits}    Create List    1    2    3    4  
#     Log To Console    @{digits}
#     FOR    ${i}    IN    @{digits} 
#         Log To Console    ${i}
#     END

Log Range
    FOR    ${i}    IN RANGE    0    10    2
        Log    ${i}
        
    END

Perform if else
    [Arguments]    ${num}
    ${value}    Evaluate    ${num}%2
    IF    ${value}==0
        Log To Console    ${num} is even.
    ELSE
        Log To Console    ${num} is odd.
        Log To Console    The remainder is ${value}.
    END
