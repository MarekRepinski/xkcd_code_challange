# xkcd_code_challange

A Flutter project challange for Shortcut.
**Note: Explanations and solution further down in the document.**

## The Challenge

A client of ours has just discovered [xkcd comics](https://xkcd.com/).

<p align="center">
  <a href="https://www.xkcd.com/327/"><img src="https://imgs.xkcd.com/comics/exploits_of_a_mom.png"/></a>
</p>

Disregarding the abundance of similar apps, she wants to create a comic viewer app, right now! She came up with a list of requirements, too! The user should be able to:

- browse through the comics,
- see the comic details, including its description,
- search for comics by the comic number as well as text,
- get the comic explanation
- favorite the comics, which would be available offline too,
- send comics to others,
- get notifications when a new comic is published,
- support multiple form factors.

Quite a list! :scream:

Luckily, there are a few services available to ease some of the bullet points. There's the [xkcd JSON API](https://xkcd.com/json.html), which can be used to access the comics. Then there's [xkcd search](https://relevantxkcd.appspot.com/), which can help with the search. Finally, there's [explain xkcd](http://www.explainxkcd.com/), which offers the explanation for all the comics.

Still, does she expect all this in the first iteration?

## The Task

Given the amount of work, the client has agreed to an [MVP](https://en.wikipedia.org/wiki/Minimum_viable_product), but only if our best engineer is involved.

This is where you come in! :tada:

Your task is to pick a few features you think are best suited for an MVP. The tech stack is completely up to you - use whichever language you're most comfortable with (we :heart: Kotlin and Swift) and any third party libraries and tools you need to get the job done. Considering this is the MVP, your code should be architectured in a way that makes it easy to add and extend features.

Also, the client doesn't have a budget for a designer. She doesn't expect anything fancy, but she trusts you to come up with something reasonable.

She set the deadline to 3 days from your first commit but understands there are other things besides work. A quick note in a README file explaining the delay does the trick. For example:

> Ran over the time limit as birthday celebrations for auntie Linda had to be had. :beer:

## The implementation
My aim was to finish all the tasks and deliver a sparkling fine MVP. But I ran out of time and also out of steam. I happened to be in Warsaw for the last days and that town got hit by a +30 degrees heatwave :sweat:. 
But in four days, approx 24 hours effective working time, I got most of them. The ones a missed:
- search for comics by the comic number as well as text,
- favorite comics available offline too,
- unit & integration tests,

Development of the search function got halted because "relevantxkcd.appspot.com" didn't seem to work, at all! I totally missed that favorite comics should be available offline, sorry. And testing... Well, that part always has low priority when it comes to deliver a MVP fast. And to be frank, I not so experienced in writing tests.

## Solutions
I used Flutter-framework with GetX to
- separate logic code from design code,
- handle states,
- navigation

There's a controller to every page for logic code and a service which is injected at start.

I used:
- Http-plugin to handle communication with the API
- Webview Flutter-plugin to embed a web-browser to display "www.explainxkcd.com"
- Share Plus-plugin to share Comics as images
- GetStorage-plugin to save favorites and discover new comics

## Final words

It was a fun code challenge, which I managed to misspell in the project name :laughing:
The most challenging part was that the API was so lousy and slow... If I could talk to the Back-end people I would ask for a list of all comics, not just one at the time. As it is now you can't load them all in one go, it takes to long. But the API is also so slow sometimes. If you load the strips one by one the browsing will get very jerky. My solution was to load 20 strips at a time to a list. When you browse to the last one, then the list will be added with 20 more and so on. A loading screen is displayed so the user don't think that there's something wrong with his device.
I think that is all,
Thanks!
