<?php
session_start();
if ($_COOKIE["login_stub"])
	{
		$encrypted = $_COOKIE["login_stub"];
		$decoded = explode( ",", base64_decode($encrypted));
		$user_id = $decoded[0];
		$username = $decoded[1];
		if ($username!='' && $user_id !='')
			{
				$_SESSION['usercenter']['user_id'] = $user_id;
				$_SESSION['usercenter']['name'] = $username;
			}
	}
?>
<a name="top" id="top"></a>
<div class="top_bg">
  <div class="top clearfix">
	<p class="fl">中国区维修服务中心（日置(上海) 商贸有限公司）</p>
    <p class="fr">
	<?php if($_SESSION['usercenter']['name'])
	echo "<a href=\"/userscenter/im_logout.php\"><img src=\"/userscenter/images/hioki_r1_c30.jpg\" width=\"28\" height=\"26\" />会员退出</a>";
	?>
	 <img src="/userscenter/images/hioki_r1_c32.jpg" width="22" height="26" />400-920-6010</p>
  </div>
</div>
<div class="header">
	 <h1 class="fl"><a href="/demo/"><img width="150" height="30" alt="HIOKI" src="/userscenter/images/hioki_r4_c3.jpg" /></a></h1>
	 <ul>
	 <li>
	 <a href="/demo/">首　　页</a>
	 </li>
	 <li>
	 <a href="/news.html">新　　闻</a>
	 </li>
	 <li>
	 <a href="/industries/1/products">产品一览</a>
	 </li>
	 <li>
	 <a href="/company.html">公司介绍</a>
	 </li>
	 <li>
	 <a href="/contact.html">联系我们</a>
	 </li>
	 <li class="nav_li02">
	 <a href="/repair.html">维修中心</a>
	 </li>
	 </ul>
	 </div>
