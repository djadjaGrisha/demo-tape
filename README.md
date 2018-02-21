# README

* There should be a pull request, but at the very beginning I've set up the app ('cause rails generator disallow setting up an app in not empty folder) and after add remote repository url. Now I got unrelated histories in branches. So, when I've realized a problem it was too many things done for coming back and doing them again. Right way in that case was to branch from master, clear the folder, commit changes and after that set up the new rails app.

## A link to my deployed web app
https://convert-kit.herokuapp.com/

## My thoughts about the exercise
Intresting idea, but i'd like to be able to get a link for a song to have easy access to listen it. So, in that case probably more useful send a link to a song or a play list, maybe use some messenger bot. From other side, it could be left for future development. Particular exercise seems easy at the very beginning, but has intresting details along of implementation, probably 'cause there's no TOR or strong requirements and I was free to apply defferent logic up to me).

## About how long I spent on it
A little bit more than 10,5 hours

## Aspects of the application I would implement or improve given more time
Of course, there should be a validation of data user inputs in the app. Storing some user data seems to me a good idea. E.g. to have some statistic data or let user to have some default phone number. As I mensioned above I'd like to have possibility to chose what I want to share whole playlist or particular song if I use the app. Also the layout looks a little bit ugly and UX isn't perfect.

# ➿ Demo Tape

## Want to go platinum? Here's how you start.

ConvertKit, like any proper record label, is rather discerning of the artists
we sign. We heard you have a long list of cuts, but we need to hear some fresh
tracks before we bring you into the studio for a sesh. We're looking for a
certain sound: out-of-the-ordinary but not too renegade.

If your code is catchy, your tests show talent, and your refactoring is ready
for the big time, maybe we can talk about a deal. Rockstars, this is the wrong
record company for you.

Thanks in advance for your tape!

  1. Use this repo.

  2. Try your hand at the following exercise.

    This Ruby script sends an SMS message containing the most popular track of
    an artist on Spotify.  To test, set TEST_PHONE_NUMBER environment variable and
    then run `bundle exec lib/demo_tape.rb`.  If all goes well, you should see the Beib's top track
    delivered directly to your phone.

    Below is a list features for you to implement, including in-browser
    features which will require software to handle HTTP requests, perhaps using
    a web framework like Rails or Sinatra.

    As you add the following features, please use or replace the current
    implementation and test suite, adding new tests as you see fit and making
    commits with informative messages.

      1. Users should specify a artist and their phone number, then
         click a button to have the top track sent to them

      2. Users should see a success message after they have clicked a
         button and successfully requested an SMS be sent _without the page
         reloading_

      3. Implement a feature or improvement of your choosing. You're free to
         grab something from the icebox (see below) or devise another.

    The feature set of this app is minimal so that you can focus on aspects
    that you consider important for a robust production app built in
    collaboration with other developers.


  3. Deploy your app so that it is available via the internet.
     [Heroku](https://www.heroku.com) offers a free, easy to use platform for
     such things.

  4. Submit a pull request with:

      - a link to your deployed web app
      - your thoughts about the exercise
      - about how long you spent on it
      - aspects of the application you would implement or improve given more
        time

## Things we are looking for

- A working app!
- Your best work, so use a language you are very comfortable with
- Clean code
- Well-tested code
- A good architecture
- A robust, production-ready app
- An app ready for collaboration with other developers

## Things we aren't looking for

* A glitzy, flashy submission.  We'd rather you spend more time writing well-architected and well-tested code than making it look pretty.

## Notes

There are some Spotify and Twilio credentials committed in the code that are
attached to an account with some credits.  Feel free to use those credentials
for this assignment.

## Timebox

Spend no more than 10 hours on this in total.  It is perfectly valid to call out the things that you *would have* done, had you more time.

## Icebox

- Display artist info in the browser. Give it a cool layout.
- Embed the [play
  widget](https://developer.spotify.com/technologies/widgets/spotify-play-button/)
  and update it live as the user searches for different artists.
- Display links to album reviews in the single page app
- Popularity Trends. Which related group is most popular or increasing in popularity the quickest?
