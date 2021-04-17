<?php
/**
 * Created By PhpStorm.
 * User : Latent
 * Date : 2021/4/7
 * Time : 3:53 下午
 **/

return [
  'github' => [
      'client_id'=>env('GITHUB_CLIENT_ID','46b6e2304c11077b5eb6'),
      'redirect_uri'=>env('GITHUB_CALLBACK','https://api.pltrue.top/api/githubCallBack'),
      'client_secret'=>env('GITHUB_SECRET','484378209f6e662e58c76332455740742f39a1ec'),
  ],
  'gitee' => [
        'client_id'=>env('GITEE_CLIENT_ID','74ee75f10437b4862d653a682111e5ddca1d24422f00ec884453ad232ae07ac9'),
        'redirect_uri'=>env('GITEE_CALLBACK','https://api.pltrue.top/api/giteeCallBack'),
        'client_secret'=>env('GITEE_SECRET','2365a07a73dc25a27e5c7a968248b96beb53a1ad300de7ba6bf4ffe247a4b386'),
  ],
  'weibo' => [
        'client_id'=>env('WEIBO_CLIENT_ID','1949419161'),
        'redirect_uri'=>env('WEIBO_CALLBACK','https://api.pltrue.top/api/weiboCallBack'),
        'client_secret'=>env('WEIBO_SECRET','38ad194c8302f42d8d6c7bc7704595e7'),
  ]
];
