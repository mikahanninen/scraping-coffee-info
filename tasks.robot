*** Settings ***
Library     RPA.Browser.Playwright
Library     Collections


*** Tasks ***
Minimal task
    New Browser    chromium    headless=false
    New Page    https://www.rossstreetroasting.com/collections/ross-street-roasting-coffee-products
    ${coffees}=    Get Elements    //div[contains(@class, "product-card-top")]/parent::div
    FOR    ${index}    ${coffee}    IN ENUMERATE    @{coffees}    start=1
        ${name}=    Get Attribute    ${coffee} > //div[contains(@class, "product-card-top")]//a    title
        # ${allmoney}=    Get Elements    ${coffee} > //span[@class="money"]
        # @{allprices}=    Create List
        # FOR    ${m}    IN    @{allmoney}
        #    ${money}=    Get Text    ${m}
        #    Append To List    ${all_prices}    ${money}
        # END
        # ${money_string}=    Evaluate    ' '.join($allprices)
        Log To Console    ${index}: ${name} ${money_string}
    END
