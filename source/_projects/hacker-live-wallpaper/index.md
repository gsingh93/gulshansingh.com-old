---
layout: page
title: "Hacker Live Wallpaper"
comments: true
sharing: true
---
One morning I woke up and decided I wanted to make a Android live wallpaper. I put aside all of my homework for the day, and by the end of day I had a working product.

This wallpaper is essentially the Matrix falling rain animation with zeros and ones. It let's you customize all of the colors, the speeds, the text size, and even whether you want a flat animation or you want the falling binary sequences to have depth.

The animation itself wasn't hard. I just randomly generated some random zeros and ones, drew them on a `SurfaceView`, and decreased the alpha of the previous bits each time I added a bit to the bottom. Each bit sequence is running in it's own thread.

The hard part was optimizing the code. A live wallpaper is going to be running constantly, unlike most Android applications, and if the user sees that it drains their battery, they're going to uninstall it. I ended up doing a number of optimizations (you can look through the commits to see all of them). Some include switching the bit container from a `LinkedList` to an `ArrayDeque` (why this helps may not be immediately clear), storing all of the strings in an array and choosing the string randomly instead of calling `Integer.toString()` on a randomly generated bit, and most importantly removing all `foreach` loops from the code. Since each bit sequence is in it's own thread and there are many bit sequences on the screen, using a `foreach` loop meant that an implicit `Iterator` was being created and, shortly after, garbage collected. According to the logcat, this change reduced the garbage collection frequency from once very 10 milliseconds to once every minute and a half (now it should be clear why I switched to an `ArrayDeque`). There were many other optimizations, and I recommend you take a look at the commit log.

One thing this project taught me was how to track down memory leaks. There was a particular memory leak that took me months to track down, but it allowed me learn about tools such as [MAT](http://www.eclipse.org/mat/). I highly recommend [this video](https://www.youtube.com/watch?v=_CruQY55HOk) from Google I/O explaining how to debug memory leaks and a great explanation of Dominator trees. In the end, it turned out you have to call the `ScheduledThreadPoolExecutors.shutdown()` in order for it and it's threads to be garbage collected properly. I must have wasted a month of effort of that, but in the end it increased the performance of my code and taught me a lot.

You can see the source on [Github](https://github.com/gsingh93/hacker-live-wallpaper), download it on [Google Play](https://play.google.com/store/apps/details?id=com.gulshansingh.hackerlivewallpaper&hl=en) or even download it from [F-Droid](https://f-droid.org/repository/browse/?fdfilter=Hacker%20Live%20wallpaper&fdid=com.gulshansingh.hackerlivewallpaper), a catalogue of FOSS (Free and Open Source) apps.
