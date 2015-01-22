---
layout: page
title: "Sikh History Questions Quiz Site"
comments: true
sharing: true
---
My parents teach Punjabi at our local Gurdwara. Part of the curriculum is Sikh history. We have a few hundred questions that we distribute to the students, and each grade learns a certain section of them. In your average middle school, high school, or college history class, there are a number of online resources that help you learn this type of information. There are information websites, games, flash card sites, etc, but none of these resources are available when it comes to teaching Punjabi or Sikh history. Because of this, I set out to create an online Sikh history quiz site, that will allow students (or anyone else) to study these Sikh history questions.

The first challenge was parsing the questions. All of our questions were specified in a Word Document, so I used the [Apache POI](https://poi.apache.org/) project to extract the text of the document. Since questions and answers were properly formatted in the document, I was able to use regex to extract all of the questions and answers. I then wrote the extracted questions and answers to an XML file.

Then I wrote a PHP script that would load the XML questions and answers into a database. This was trivial using PHP's `simplexml_load_file()` function. The rest is just some PHP, JavaScript, and JQuery magic. You can see all of the source [here](https://github.com/gsingh93/sikhhistoryquestions) and view the site [here](http://michigangurudwara.com/sikhhistoryquestions/).
