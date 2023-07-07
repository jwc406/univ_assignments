<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:user="http://mycompany.com/mynamespace">
  <xsl:output method="html"></xsl:output>
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,inital-scale=1" />
        <title>PetPang :: 세상의 모든 반려동물을 위한 곳</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
        <script language="Javascript"><![CDATA[$(document).ready(function() {
		var $banner = $(".banner").find("ul");

		var $bannerWidth = $banner.children().outerWidth();
		var $bannerHeight = $banner.children().outerHeight(); 
		var $length = $banner.children().length;
		var rollingId;

		rollingId = setInterval(function() { rollingStart(); }, 5000);
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { 
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				$(this).find("li:first").remove();
				$(this).css("left", 0);
			});
		}
	});
    
function MyFunction(divName){

           //hidden val
           var hiddenVal = document.getElementById("tempDivName"); 

           //hide old
           if(hiddenVal.Value != undefined){
               var oldDiv = document.getElementById(hiddenVal.Value); 
               oldDiv.style.display = 'none'; 
           }

           //show div
               var tempDiv = document.getElementById(divName); 
               tempDiv.style.display = 'block';              

           //save div ID
               hiddenVal.Value = document.getElementById(divName).getAttribute("id");

           }]]></script>
        <style>* {
  box-sizing : border-box;
}

html, body {
  font-family:'NEXON Lv1 Gothic OTF';
  width: 100%;
  height: 100%;
  margin: 0;
}

a:link, a:visited, a:hover{ 
  color: black; 
  text-decoration: none;
}

h1{
  text-align:center;
  padding: 30px 0 20px 0;
} 

.half_highlight {
  background: linear-gradient(180deg,rgba(255,255,255,0) 50%, #FFD0AE 50%);
} 

.goto_top{
  position: fixed; 
  bottom: 20px; 
  right: 20px;
}

.rollingbanner {
  box-sizing : content-box;
  width: 100%;
  height: 500px;
  padding-bottom: 20px;
  margin: 0 auto;
}

.main {
  position: relative;
  box-sizing : content-box;
  width: 1920px;
  height: auto;
  padding: 0px 50px 50px 50px;
  margin: 0 auto; 
}

/*main 제품*/

.product_list { 
  width:1920px;
  height: auto;
  list-style-type: none;
  border:0;
}

.product_list li {
  float: left;
  margin:20px 20px 0 0; 
  position:relative; 
  width:600px; 
  height:480px; 
  border:3px solid #f9f9f9;
}

.product_list li:hover { 
  border:3px solid #ffd5c7;
}

.product_list dl { 
  padding:370px 0 0 0;
}

.product_list dt { 
  font-size: 20px;
  text-align: center;
  padding: 20px 0 10px 0;
}

.product_list dd { 
  font-size: 20px;
  text-align: center;
  padding: 15px 0 10px 0; 
  border: 0;
  padding-top: 5px;
}

.product_list .img { 
  position:absolute;
  overflow:hidden;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -65%);
}

.scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}

.scale:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}

.product_list .price { 
  margin:0;
  text-align: center;
  font-size:21px; 
  color:#1a1a1a; 
  font-weight:bold;
}

@font-face {
    font-family: 'NEXON Lv1 Gothic OTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

header{
  background-color: white;
  font-size: 70px;
  padding: 50px 0 35px 0;
  text-align: center;
}

.topmenu{  
  position: absolute;
  top: 0;
  right: 10px;
  background: white;
}

.topmenu ul{
  background: white;
  border:0;
}

.topmenu li{
  list-style-type: none;
  float: right;
  margin: 20px 30px 0 0;
  background: white;
}

.topmenu a {
  color: DarkSalmon;
  font-size: 20px;
  padding: 0;
  display:inline;
  cursor:pointer;
}

.topmenu a:hover { 
  text-decoration: underline;
  color: black;
}

ul {
  font-size: 0;
  text-align: center;
  list-style-type: none;
  overflow: hidden;
  border-top:1px solid #d9d9d9;
  border-bottom:1px solid #d9d9d9;
  background-color: white;
}

li {
  display: inline;
}

li a, .dropbtn {
  display: inline-block;
  color: black;
  width: 250px;
  font-size: 23px;
  text-align: center;
  padding: 18px 50px;
  text-decoration: none;
  transition-duration: 0.4s;
  cursor:pointer;
}

li a:hover, .dropdown:hover .dropbtn {
  color: DarkSalmon;
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  font-size: 20px;
  padding: 20px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
background-color: #d9d9d9;
color: black;
}

.dropdown:hover .dropdown-content {
  display: block;
}


/*롤링배너*/ 
.banner {
position: absolute; 
width: 100%; 
height: 500px;
padding: 0;
overflow: hidden;
}

.banner ul {
position: absolute; 
margin: 0; 
padding: 0; 
list-style: none; 
}

.banner ul li {
float: left; 
width: 2500px; 
height: 500px; 
margin:0; 
border: 0;
}

.banner img {
width: 2500px;
height: 500px;
}

footer {
bottom: 0;
left: 0;
right: 0;
text-align: center;
font-size: 20px;
padding: 1px;
margin-top: 129px;
color: white;
background-color: #303030;
}</style>
      </head>
      <body>
        <input id="tempDivName" type="hidden" />
        <div class="topmenu">
          <ul>
            <li>
              <a>마이페이지</a>
            </li>
            <li>
              <a>로그인</a>
            </li>
            <li>
              <a>회원가입</a>
            </li>
            <li>
              <a>장바구니(0)</a>
            </li>
          </ul>
        </div>
        <header>
          <a href="#" onclick="MyFunction('dogFood');">
            <strong>PetPang 🐾</strong>
          </a>
        </header>
        <div class="goto_top">
          <a href="#">
            <img src="gotobtn.png" style="cursor:pointer;" width="80px" height="80px" />
          </a>
        </div>
        <ul>
          <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">개</a>
            <div class="dropdown-content">
              <a onclick="MyFunction('dogFood');">사료</a>
              <a onclick="MyFunction('dogSnack');">간식</a>
              <a onclick="MyFunction('dogElse');">용품</a>
            </div>
          </li>
          <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">고양이</a>
            <div class="dropdown-content">
              <a onclick="MyFunction('catFood');">사료</a>
              <a onclick="MyFunction('catSnack');">간식</a>
              <a onclick="MyFunction('catElse');">용품</a>
            </div>
          </li>
          <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">기타 반려동물</a>
            <div class="dropdown-content">
              <a onclick="MyFunction('etcFood');">사료</a>
              <a onclick="MyFunction('etcSnack');">간식</a>
              <a onclick="MyFunction('etcElse');">용품</a>
            </div>
          </li>
        </ul>
        <div class="rollingbanner">
          <div class="banner">
            <ul>
              <li>
                <img src="rollingbanner1.jpg" onclick="javascript:newin=window.open('http://petbtob.co.kr/product/list.html?cate_no=426');" style="cursor:pointer;"></img>
              </li>
              <li>
                <img src="rollingbanner2.jpg" onclick="javascript:newin=window.open('http://petbtob.co.kr/product/list.html?cate_no=410');" style="cursor:pointer;"></img>
              </li>
              <li>
                <img src="rollingbanner3.jpg" onclick="javascript:newin=window.open('http://petbtob.co.kr/product/list.html?cate_no=416');" style="cursor:pointer;"></img>
              </li>
              <li>
                <img src="rollingbanner4.jpg" onclick="javascript:newin=window.open('http://petbtob.co.kr/product/search.html?banner_action=&amp;keyword=%EB%B2%84%EC%B8%A0%EB%B9%84');" style="cursor:pointer;"></img>
              </li>
              <li>
                <img src="rollingbanner5.jpg" onclick="javascript:newin=window.open('http://petbtob.co.kr/product/list.html?cate_no=415');" style="cursor:pointer;"></img>
              </li>
            </ul>
          </div>
        </div>
        <div class="main" id="dogFood">
          <xsl:apply-templates select="/Companion_Animal/animal[@animal_species='dog']/Food" />
        </div>
        <div class="main" id="dogFood" style="display:none;">
          <xsl:apply-templates select="/Companion_Animal/animal[@animal_species='dog']/Food" />
        </div>
        <div class="main" id="dogSnack" style="display:none;">
          <xsl:apply-templates select="/Companion_Animal/animal[@animal_species='dog']/Snack" />
        </div>
        <div class="main" id="dogElse" style="display:none;">
          <xsl:apply-templates select="/Companion_Animal/animal[@animal_species='dog']/Else" />
        </div>
        <div class="main" id="catFood" style="display:none;">
          <xsl:apply-templates select="/Companion_Animal/animal[@animal_species='cat']/Food" />
        </div>
        <div class="main" id="catSnack" style="display:none;">
          <xsl:apply-templates select="/Companion_Animal/animal[@animal_species='cat']/Snack" />
        </div>
        <div class="main" id="catElse" style="display:none;">
          <xsl:apply-templates select="/Companion_Animal/animal[@animal_species='cat']/Else" />
        </div>
        <div class="main" id="etcFood" style="display:none;">
          <xsl:apply-templates select="/Companion_Animal/animal[@animal_species='etc']/Food" />
        </div>
        <div class="main" id="etcSnack" style="display:none;">
          <xsl:apply-templates select="/Companion_Animal/animal[@animal_species='etc']/Snack" />
        </div>
        <div class="main" id="etcElse" style="display:none;">
          <xsl:apply-templates select="/Companion_Animal/animal[@animal_species='etc']/Else" />
        </div>
        <footer>
          <h3>PetPang (펫팡)</h3>
          <p>
            <strong>대표 </strong> : 정혜란</p>
          <p>
            <strong>계좌 </strong> : 기업은행 0406-080-520201211</p>
          <p>
            <strong>대표번호 </strong> : 1214-4685</p>
        </footer>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="animal[@animal_species='dog']/Food">
    <h1>
      <span class="half_highlight">반려견 사료</span>
    </h1>
    <ul class="product_list">
      <xsl:for-each select="name">
        <li>
          <dl>
            <dt>
              <xsl:value-of select="description" />
            </dt>
            <div class="img">
              <div class="scale">
                <img onclick="javascript:newin=window.open('http://store.bom.co.kr/goods/goods_view.php?goodsNo=1000000057');" style="cursor:pointer;">
                  <xsl:attribute name="src">
                    <xsl:value-of select="image"></xsl:value-of>
                  </xsl:attribute>
                </img>
              </div>
            </div>
            <dd class="price">
              <xsl:value-of select="price" />
            </dd>
          </dl>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="animal[@animal_species='dog']/Snack">
    <h1>
      <span class="half_highlight">반려견 간식</span>
    </h1>
    <ul class="product_list">
      <xsl:for-each select="name">
        <li>
          <dl>
            <dt>
              <xsl:value-of select="description" />
            </dt>
            <div class="img">
              <div class="scale">
                <img onclick="javascript:newin=window.open('https://mall.holapet.com/goods/goods_view.php?goodsNo=1000008000');" style="cursor:pointer;">
                  <xsl:attribute name="src">
                    <xsl:value-of select="image"></xsl:value-of>
                  </xsl:attribute>
                </img>
              </div>
            </div>
            <dd class="price">
              <xsl:value-of select="price" />
            </dd>
          </dl>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="animal[@animal_species='dog']/Else">
    <h1>
      <span class="half_highlight">반려견 용품</span>
    </h1>
    <ul class="product_list">
      <xsl:for-each select="name">
        <li>
          <dl>
            <dt>
              <xsl:value-of select="description" />
            </dt>
            <div class="img">
              <div class="scale">
                <img onclick="javascript:newin=window.open('http://store.bom.co.kr/goods/goods_view.php?goodsNo=1000017676');" style="cursor:pointer;">
                  <xsl:attribute name="src">
                    <xsl:value-of select="image"></xsl:value-of>
                  </xsl:attribute>
                </img>
              </div>
            </div>
            <dd class="price">
              <xsl:value-of select="price" />
            </dd>
          </dl>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="animal[@animal_species='cat']/Food">
    <h1>
      <span class="half_highlight">반려묘 사료</span>
    </h1>
    <ul class="product_list">
      <xsl:for-each select="name">
        <li>
          <dl>
            <dt>
              <xsl:value-of select="description" />
            </dt>
            <div class="img">
              <div class="scale"></div>
              <img onclick="javascript:newin=window.open('http://www.catpang.com/shop/goods/goods_view.php?viewCode=N000001048');" style="cursor:pointer;">
                <xsl:attribute name="src">
                  <xsl:value-of select="image"></xsl:value-of>
                </xsl:attribute>
              </img>
            </div>
            <dd class="price">
              <xsl:value-of select="price" />
            </dd>
          </dl>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="animal[@animal_species='cat']/Snack">
    <h1>
      <span class="half_highlight">반려묘 간식</span>
    </h1>
    <ul class="product_list">
      <xsl:for-each select="name">
        <li>
          <dl>
            <dt>
              <xsl:value-of select="description" />
            </dt>
            <div class="img">
              <div class="scale">
                <img onclick="javascript:newin=window.open('http://www.catpang.com/shop/goods/goods_view.php?viewCode=P000003852');" style="cursor:pointer;">
                  <xsl:attribute name="src">
                    <xsl:value-of select="image"></xsl:value-of>
                  </xsl:attribute>
                </img>
              </div>
            </div>
            <dd class="price">
              <xsl:value-of select="price" />
            </dd>
          </dl>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="animal[@animal_species='cat']/Else">
    <h1>
      <span class="half_highlight">반려묘 용품</span>
    </h1>
    <ul class="product_list">
      <xsl:for-each select="name">
        <li>
          <dl>
            <dt>
              <xsl:value-of select="description" />
            </dt>
            <div class="img">
              <div class="scale">
                <img onclick="javascript:newin=window.open('http://www.catpang.com/shop/goods/goods_view.php?viewCode=N000000315');" style="cursor:pointer;">
                  <xsl:attribute name="src">
                    <xsl:value-of select="image"></xsl:value-of>
                  </xsl:attribute>
                </img>
              </div>
            </div>
            <dd class="price">
              <xsl:value-of select="price" />
            </dd>
          </dl>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="animal[@animal_species='etc']/Food">
    <h1>
      <span class="half_highlight">기타 반려동물 사료</span>
    </h1>
    <ul class="product_list">
      <xsl:for-each select="name">
        <li>
          <dl>
            <dt>
              <xsl:value-of select="description" />
            </dt>
            <div class="img">
              <div class="scale"></div>
              <img onclick="javascript:newin=window.open('http://www.dochiqueen.com/shop/shopdetail.html?branduid=987910&amp;xcode=041&amp;mcode=001&amp;scode=&amp;type=Y&amp;search=&amp;sort=order');" style="cursor:pointer;">
                <xsl:attribute name="src">
                  <xsl:value-of select="image"></xsl:value-of>
                </xsl:attribute>
              </img>
            </div>
            <dd class="price">
              <xsl:value-of select="price" />
            </dd>
          </dl>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="animal[@animal_species='etc']/Snack">
    <h1>
      <span class="half_highlight">기타 반려동물 간식</span>
    </h1>
    <ul class="product_list">
      <xsl:for-each select="name">
        <li>
          <dl>
            <dt>
              <xsl:value-of select="description" />
            </dt>
            <div class="img">
              <div class="scale">
                <img onclick="javascript:newin=window.open('http://borapet.com/product/%EB%A7%88%EB%A3%A8%EC%B9%B8-%EC%81%98%EB%9D%A0%EB%91%90%EB%B6%80/4985/category/340/display/1/8');" style="cursor:pointer;">
                  <xsl:attribute name="src">
                    <xsl:value-of select="image"></xsl:value-of>
                  </xsl:attribute>
                </img>
              </div>
            </div>
            <dd class="price">
              <xsl:value-of select="price" />
            </dd>
          </dl>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="animal[@animal_species='etc']/Else">
    <h1>
      <span class="half_highlight">기타 반려동물 용품</span>
    </h1>
    <ul class="product_list">
      <xsl:for-each select="name">
        <li>
          <dl>
            <dt>
              <xsl:value-of select="description" />
            </dt>
            <div class="img">
              <div class="scale">
                <img onclick="javascript:newin=window.open('http://www.helloaqua.com/mall/m_mall_detail.php?ps_ctid=02050000&amp;ps_goid=22219&amp;ps_page=1#A');" style="cursor:pointer;">
                  <xsl:attribute name="src">
                    <xsl:value-of select="image"></xsl:value-of>
                  </xsl:attribute>
                </img>
              </div>
            </div>
            <dd class="price">
              <xsl:value-of select="price" />
            </dd>
          </dl>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>