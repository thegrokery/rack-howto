# Purpose statement

Learn the basics of what a webserver actually does and how it turns
markdown into html dynamically and stores the data on the filesystem
for caching or to be used by a more purpose-built webserver

**Important Note:** The code in this repo is not safe to use in production.
It is full of security holes, it's not optimized, and generally shouldn't
be used! Please consider using Sinatra, Rails, Jekyll, Flask, or basically
anything else. This is for teaching purposes only.

# Main topics we'll cover

* Netcat
* Files in this repo
* Rack responses
* Building templates
* Interpolating templates

## Step 1

Open in one terminal `nc -l 9393`
Open a browser and go to 'http://localhost:9393/?person=Erica&q=test'
Open up the terminal again, type "Hello World", hit enter, then hit ctrl-D

## Steps 2-7

Start the server with:

```bash
bundle install
bundle exec shotgun
```

For each step, uncomment the next step in the app.rb and comment the
section above it (there should only be one uncommented `class HelloWorld`
at any time).

Now use your browser to request this url:
'http://localhost:9393/?person=Erica&q=test'

## Step 8

Uncomment the last section of the app.rb and read through the comments. If
you can figure out how to write files to the filesystem, you will have
mostly recreated Jekyll (minus some lovely and important things like
security, speed, generation scripts, bloginess, ...)
