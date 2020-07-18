Flow
    1. Welcomes user.
    2. Inform the user that 'exit' will exit the program
    3. Checks if there is a list of relics saved.
        a. If one is found, asks the user if they would like to update the saved list.
        b. If one is not found or the user wants to update, scrapes for relics.
    4. Asks the user what relics they would like to see: all, vaulted, or unvaulted.
    5. Displays the proper list of relics sorted first by era, then by type.
    6. Asks the user if they would like more information about a specific relic.
        a. If 'yes', asks for a relic then displays the url (potentially more in the future)
        b. If 'no', loop back to #4.

Classes
    CLI
        Takes user input and passes it to Relics
    Relics
        Sorts, stores, and returns relic info
    Scraper
        Scrapes for relic info