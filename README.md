# VIT-Hack-2020
iOS app for VIT HACK - 2020

## Checklist
- [x] Initial setup
- [x] Add Kingfisher for images
- [ ] Splash screen (Logo)
- [ ] Onboarding
  - [x] Design
  - [ ] UserDefaults - should show only first time
- [x] Authentication
  - [x] Networking for Google Authentication
  - [x] Networking for Apple Authentication
  - [x] Networking for Email Authentication
  - [x] New design setup for sign up and login (email)
    - [x] Hello (Sign Up)
    - [x] Welcome (Login)
    - [x] Forgot Password
- [x] Getting data from user (for signup)
  - [x] Networking 
  - [x] Design 
      - [x] About You
      - [x] Phone Number
      - [x] Regex for international numbers
- [x] Timeline 
  - [x] Networking
  - [x] Timeline setup according to design
    - [x] Timeline watch now button
    - [x] Timeline row dynamic height
    - [x] Timeline - check for completed events(green tick)
    - [ ] Timeline - embed youtube ??
- [ ] Speakers, Sponsors and Collaborators Screen
   - [x] Speakers collection view
        - [x] Networking
        - [x] Design
        - [ ] Link to video - YouTube or webView
   - [ ] Collaborators collection view
        - [x] Networking
        - [x] Design
        - [x] SFSafariVC + link
   - [ ] Sponsors collection view
        - [x] Networking
        - [x] Design 
        - [x] SFSafariVC + link
- [ ] About Us
   - [ ] ~~Networking~~
   - [x] Design
   - [ ] SFSafariVC + link
- [ ] FAQs 
   - [ ] Static
        - [ ] Networking
        - [ ] Tableview for QnA
        - [ ] Search bar implementation 
   - [ ] Ask Question
      - [ ] Networking to post questions
      - [ ] Design for popover
      
- [ ] Problem Statement and Tracks 
   - [ ] Domains
      - [ ] Networking to get colour, icon, name
      - [ ] Design
          - [ ] Regular collection view
          - [ ] Add Carousel for animation
   - [ ] Problem statements
      - [ ] Networking
      - [ ] Design
 - [x] Profile
   - ~~[ ] Networking~~
   - [x] Design
      - [x] Placeholder image only
      - [x] Logout
- [ ] Notifications
  - [ ] FCM token setup 
  - [ ] Networking for recieving notification using Firebase
- [ ] Data Persistence
   - [x] Auth 
   - [ ] Images 
      - [ ] Speakers
      - [ ] Sponsors
      - [ ] Collaborators
      - [x] About Us 
   - [x] User info (for profile section)
   
## How to contribute:

1. No one changes the built version for the swift or any other built configurations like pods etc.
2. No one pushes to the master directly 😬.
3. Fork the repo and work on it and then create a pull request (Don't push to master directly🤗).
4. Before starting any work make sure you pull the latest changes form master (git upstream) 👨‍💻.
