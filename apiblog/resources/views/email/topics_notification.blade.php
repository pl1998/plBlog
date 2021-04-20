<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>你有新的评论--请查收</title>
    <style>
        .login-avatar{
            width: 30px;
            height: 30px;
            border-radius:90%
        }
    </style>
</head>
<body>
<p>评论文章:{{$topic->article->title}}</p>
<p>评论内容:{{$topic->content}}</p>
<p>
    <img class="login-avatar" src="{{$topic->user->avatar}}">
    评论人:{{$topic->user->name}}
<br/>
<p>评论时间:{{$topic->created_at}}</p>
</p>
</body>
</html>
