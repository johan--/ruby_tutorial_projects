cookiesAllowed = null

ga = "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){" +
      "(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o)," +
      "m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)" +
      "})(window,document,'script','//www.google-analytics.com/analytics.js','ga');" +
      "ga('create', 'UA-X-X', 'auto');" +
      "ga('send', 'pageview');"

allowCookies = ->
  Cookies.set 'allow_cookies', 'yes', expires: 365
  $('head').append('<script>' + ga + '</script>');
  cookiesAllowed = 'yes'
  $('#cookies-bar').fadeOut()
  return

deleteCookies = ->
  cookies = Cookies.get()

  for cookie of cookies
    Cookies.remove cookie

  return

ready = ->
  cookiesAllowed = Cookies.get('allow_cookies')

  # allow cookies by clicking on any link (including the cookies bar button)
  $('a').on 'click', (e) ->
  allowCookies() unless cookiesAllowed == 'yes'

  # allow cookies by scrolling
  $(document).scroll ->
    allowCookies() unless cookiesAllowed == 'yes'

  # delete cookies
  $('#delete-cookies').on 'click', (e) ->
    e.preventDefault()
    deleteCookies()
    alert e.target.dataset.done

$(document).ready ready
$(document).on 'page:load', ready
