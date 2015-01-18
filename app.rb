class HelloWorld
  def call(env)
    [200, {}, ['Hello World']]
  end
end

class HelloWorld2
  def call(env)
    # Please, please, don't put params directly into the output
    # like this. It's not safe from hackers!
    [200, {}, ["Hello, #{env['QUERY_STRING']}"]]
  end
end

class HelloWorld3
  def call(env)
    request = Rack::Request.new env

    # Please, please, don't put params directly into the output
    # like this. It's not safe from hackers!
    [200, {}, ["Hello, #{request.params['person']}"]]
  end
end

class HelloWorld4
  def call(env)
    request = Rack::Request.new env
    # Please, please, don't open files blindly like this upon request
    # from an external user. It's not safe from hackers!
    file = File.open(request.params['q'] + '.html')

    [200, {}, file]
  end
end

class HelloWorld5
  def call(env)
    request = Rack::Request.new env
    @person = request.params['person']

    # Please, please, just don't do anything in this file. Use sinatra
    # or rails to do this stuff. They're smarter than us! :)
    file = File.open(request.params['q'] + '.html.erb')
    template = ERB.new(file.read)
    result = template.result(binding)

    [200, {}, [result]]
  end
end

class HelloWorld6
  def call(env)
    request = Rack::Request.new env
    @person = request.params['person']

    # This one is actually pretty safe. As we go up to higher-level and
    # more complex gems they start to do more things like sanitization.
    file = request.params['q'] + '.md'
    require 'github/markup'
    @page = GitHub::Markup.render(file, File.open(file).read)

    # Please, please, just don't do anything in this file. Use sinatra
    # or rails to do this stuff. They're smarter than us! :)
    layout = File.open('layout.html.erb')
    template = ERB.new(layout.read)
    result = template.result(binding)

    [200, {}, [result]]
  end
end

class HelloWorld7
  def call(env)
    # Initial creation steps ("caching")
      # Make a request object
      # Find params, sanitize them and pass them to a template tool like
      # markdown or ERB or github-markup
      # Make the layout, pass in the page object we just created
      # Save the plain html file to a folder named something like _site
    # Now we just need to go back to HelloWorld4
      # Or even better, use Apache or Nginx which are /much/ better at
      # serving plain html pages.
    # This is called caching, but we could do this without requesting
    # webpages at all. This is what `jekyll build` does. So all you get
    # is plain html pages with no need to boot a ruby server at all. This
    # is what github-pages does (ie: username.github.io)

    [200, {}, ['']]
  end
end
