---
layout: page
title: "FaceBash"
comments: true
sharing: true
---
This was a project for the Yahoo! 2013 Intern Hackathon. It's a Chrome extension that puts a Bash client inside of Facebook. The idea came to me one day when I had the urge to type `exit` into a Facebook chat box working with the terminal for the entire day. I convinced my group to work on this project for the hackathon, and we ended up being finalists.

The general approach we took was reverse engineering the Facebook site. For example, if we wanted to close a chat box with the command `exit`, we would find a way to uniquely identify a chat box's exit button, and when the user types the `exit` command and hits `shift+enter`, we execute some jQuery code to click the button. Commands like `whoami` search for the URL containing a link to the user's profile page, parse the user's user name from the URL, and programmtically add a `div` into the message box displaying the command output, so that only you see the output, not the user you're chatting with.

You can see a full list of commands on the Github page. This extension isn't complete yet, but when it is, we'll submit it to the Chrome store. Until then, you can clone it and install it yourself.

Source: https://github.com/gsingh93/facebook-cli
