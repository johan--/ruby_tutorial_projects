# app.rb is used to configure your app.  This code is only run on the server,
# then any config options in config.public are passed to the client as well.

Volt.configure do |config|
  # Setup your global app config here.

  #######################################
  # Basic App Info (stuff you should set)
  #######################################
  config.domain = 'volt-chat.com'
  config.app_name = 'Volt_chat'
  config.mailer.from = 'Volt_chat <no-reply@volt-chat.com>'

  ############
  # App Secret
  ############
  # Your app secret is used for signing things like the user cookie so it can't
  # be tampered with.  A random value is generated on new projects that will work
  # without the need to customize.  Make sure this value doesn't leave your server.
  #
  # For added security we recommend moving the app secret into an environment.  You can
  # setup that like so:
  #
  # config.app_secret = ENV['APP_SECRET']
  #
  config.app_secret = 'VtEkYI0NBQ_-56KbTE3Mkm75CWf9tC_c-j1yMNe0AfCUAwU-fiYoJwiFHz9dCvb_WAc'

  ###############
  # Log Filtering
  ###############
  # Data updates from the client come in via Tasks.  The task dispatcher logs all calls to tasks.
  # By default hashes in the arguments can be filtered based on keys.  So any hash with a key of
  # password will be filtered.  You can add more fields to filter below:
  config.filter_keys = [:password]

  ##########
  # Database
  ##########
  # Database config all start with db_ and can be set either in the config
  # file or with an environment variable (DB_NAME for example).

  # config.db_driver = 'mongo'
  # config.db_name = (config.app_name + '_' + Volt.env.to_s)
  # config.db_host = 'localhost'
  # config.db_port = 27017

  #####################
  # Compression options
  #####################
  # If you are not running behind something like nginx in production, you can
  # have rack deflate all files.
  # config.deflate = true

  #######################
  # Public configurations
  #######################
  # Anything under config.public will be sent to the client as well as the server,
  # so be sure no private data ends up under public

  # Use username instead of email as the login
  # config.public.auth.use_username = true

  #####################
  # Compression Options
  #####################
  # Disable or enable css/js compression.  Default is to only run in production.
  # if Volt.env.production?
  #   config.compress_javascript = true
  #   config.compress_css        = true
  # end

  ################
  # Mailer options
  ################
  # The volt-mailer gem uses pony (https://github.com/benprew/pony) to deliver e-mail.  Any
  # options you would pass to pony can be setup below.
  # NOTE: The from address is setup at the top

  # Normally pony uses /usr/sbin/sendmail if one is installed.  You can specify smtp below:
  # config.mailer.via = :smtp
  # config.mailer.via_options = {
  #   :address        => 'smtp.yourserver.com',
  #   :port           => '25',
  #   :user_name      => 'user',
  #   :password       => 'password',
  #   :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
  #   :domain         => "localhost.localdomain" # the HELO domain provided by the client to the server
  # }

  #############
  # Message Bus
  #############
  # Volt provides a "Message Bus" out of the box.  The message bus provides
  # a pub/sub service between any volt instance (server, client, runner, etc..)
  # that share the same database.  The message bus can be used by app code.  It
  # is also used internally to push data to any listening clients.
  #
  # The default message bus (called "peer_to_peer") uses the database to sync
  # socket ip's/ports.
  # config.message_bus.bus_name = 'peer_to_peer'
  #
  # Encrypt message bus - messages on the message bus are encrypted by default
  # using rbnacl.
  # config.message_bus.disable_encryption = true
  #
  # ## MessageBus Server -- the message bus binds to a port and ip which the
  # other volt instances need to be able to connect to.  You can customize
  # the server below:
  #
  # Port range - you can specify a range of ports that an instance can bind the
  # message bus on.  You can specify a range, an array of Integers, or an array
  # of ranges.
  # config.message_bus.bind_port_ranges = (58000..61000)
  #
  # Bind Ip - specifies the ip address the message bus server should bind on.
  # config.message_bus.bind_ip = '127.0.0.1'

  #############
  # Concurrency
  #############
  # Volt provides a thread worker pool for incoming task requests (and all
  # database requests, since those use tasks to do their work.)  The following
  # lets you control the size of the worker pool.  Threads are only created as
  # needed, and are removed after a certain amount of inactivity.
  # config.min_worker_threads = 1
  # config.max_worker_threads = 10
  #
  # You can also specify the amount of time a Task should run for before it
  # timeout's.  Setting this to short can cause unexpected results, currently
  # we recomend it be at least 10 seconds.
  # config.worker_timeout = 60
end
