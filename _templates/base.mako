<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />

    <title>shazow | Andrey Petrov</title>

    <link href="/static/css/base.css" media="screen" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="/static/images/icon.png" />

    <link href='http://fonts.googleapis.com/css?family=OFL+Sorts+Mill+Goudy+TT:400,400italic&v2' rel='stylesheet' type='text/css'>
    <%block name="extra_head" />
</head>


<body>

    <h1>Andrey Petrov</h1>

${next.body()}

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-407051-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>!window.jQuery && document.write(unescape('%3Cscript src="/static/js/libs/jquery.min.js"%3E%3C/script%3E'))</script>

<%block name="tail" /></body>

</html>
<!-- Hi. -->
