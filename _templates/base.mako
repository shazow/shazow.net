<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title><%block name="title">shazow | Andrey Petrov</%block></title>

    <link href="/static/css/base.css?3" media="screen" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="/static/images/icon.png" />

    <link href='//fonts.googleapis.com/css?family=OFL+Sorts+Mill+Goudy+TT:400,400italic&amp;v2' rel='stylesheet' type='text/css'>
    <%block name="extra_head" />
</head>


<body>

${next.body()}

<script type="text/javascript">
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    if (document.location.hostname != 'localhost') {
        ga('create', 'UA-407051-1', 'shazow.net');
    }

    ga('send', 'pageview');
</script>

<%block name="tail">
</%block>

</body>

</html>
<!-- Hi. -->
