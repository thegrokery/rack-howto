# Purpose statement

Learn the basics of what a webserver actually does and how it turns
markdown into html dynamically and stores the data on the filesystem
for caching or to be used by a more purpose-built webserver

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

For each step, change the config.ru to the next HelloWorld and use the url:
'http://localhost:9393/?person=Erica&q=test'

