//
1. Project Information:
    - SwiftUI frameworks
    - Core Data
    - MVVM architecture pattern
    - Log in information:
        username = "username"
        password = "password"
    
2.Task Accomplished:
    - Allow a single user to “log in”/”log out”.
    - Display a list of tweets by recency from newest to oldest
    - Allow the user to post a new tweet (which is appended to the list).
    - On launch, if the user is logged in, automatically display older tweets and only query for newer ones.

3. Unit Testing
    - Core Data
        + Test if new tweet is saved
    - I also created a moc list of tweet and write unit test base on that. Which included:
        + Test sorted list by date
        + Test Display a list of tweets by recency from newest to oldest
        + Test login with correct username and password

4. Questions and Answers:
    a. If you were querying a real web service, is it guaranteed to respond immediately? What happens if the request fails or takes too long.
        - It is not guaranteed to respond immediately because fetching from an API depends on the internet speed, iOs versions..
        - If the fetch request being called in main thread ( which we should not) it will also slow down the UI for the update.
        - If the request fails we need to send user a notification
    b. Are users always able to log in?
        - User can only be looged in with correct username and password
    c. Should we add pagination if the list is too long?
        - In my opinion, scrolling is better than clicking( tapping )
        
# DucDang_Fuze_TakeHomeTest
