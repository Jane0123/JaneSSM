<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>中国地图</title>
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/raphael-min.js"></script>
<script type="text/javascript" src="js/chinaMapConfig.js"></script>
<script type="text/javascript" src="js/map-min.js"></script>
<style>
	*{margin:0;padding:0;border: none;}
	body { color: black; text-align: center; font: 10px "微软雅黑";background-color: lightblue; }
	.mapTipText{width: 900px;height: 20px;background-color: yellow;}
	.mapTipText .mapTipImg{height: 66px; width: 66px; float: left;border: 9px double pink; border-radius: 50%;overflow: hidden;margin: -12px 5px 0 -12px;}
	.mapTipText .mapTipImg img{width: 100%;height: 100%;}
	.mapTipText .mapTipList{float: left;margin-left: 4px;}
	.mapTipText .mapTipList ul{ width: 303px;padding-right: 10px;}
	.mapTipText .mapTipList ul li{list-style: none;float: left;padding: 10px 13px 0 3px;}
	.mapTipText .mapTipList ul li a{color: blue;text-decoration:none;}
	.mapTipText .mapTipList ul li a:hover{background-color:black;color:white;}
</style>
<script type="text/javascript">
	$(function(){
		$('#ChinaMap').SVGMap({
			mapWidth: 1600,
			mapHeight: 700
		});
	});
</script>
</head>
<body>
<div class="wrap" style="margin-top: 50px;">
<div class="itemCon" style="float: left">
	<div id="ChinaMap" style="margin: 50px;"></div>
	<div id="stateTip" style="position: absolute;left: 100%;text-align: left;display: inline;"></div>
</div>
<div id="mapTipContent" style="width: 900px;height:1400px;margin: 0 auto;display: none">
	<div class="mapTipText mapTipText0">
		<div class="mapTipImg"><img src="image/heilongjiang.jpg" alt=""/></div>
		<div class="mapTipList">
			<h2><a href="">黑龙江<span>Heilongjiang</span></a></h2>
			<ul>
				<li><a href="">哈尔滨</a></li>
				<li><a href="">漠河</a></li>
				<li><a href="">五大连池</a></li>
				<li><a href="">兴凯湖</a></li>
				<li><a href="">雪乡</a></li>
				<li><a href="">大兴安岭</a></li>
				<li><a href="">齐齐哈尔</a></li>
				<li><a href="">牡丹江</a></li>
				<li><a href="">伊春</a></li>
				<li><a href="">大庆</a></li>
				<li><a href="">镜泊湖</a></li>
				<li><a href="">帽儿山</a></li>
			</ul>
			</br>
			<h1>黑龙江省，简称黑，省会哈尔滨，位于中国最东北部，中国国土的北端与东端均位于省境。因省境东北有黑龙江而得名。
               黑龙江东部和北部以乌苏里江黑龙江为界河与俄罗斯为邻，与俄罗斯的水陆边界长约3045公里；西接内蒙古自治区，南连吉林省。介于北纬43°26′~53°33′，东经121°11′~135°05′，南北长约1120公里，东西宽约930公里，面积47．3万平方公里。
               黑龙江辖1个副省级市（哈尔滨）、1个较大的市（齐齐哈尔）、10个地级市、1个地区，以及64个市辖区、18个县级市、45个县、1个自治县。黑龙江西部属松嫩平原，东北部为三江平原，北部、东南部为山地，多处平原海拔50～200米。
               黑龙江是中国重工业基地，工业门类以机械、石油、煤炭、木材和食品工业为主。</h1>
		</div>
	</div>
	<div class="mapTipText mapTipText1">
		<div class="mapTipImg"><img src="image/jilin.jpg" alt=""/></div>
		<div class="mapTipList">
			<h2><a href="">吉林<span>Jilin</span></a></h2>
			<ul>
				<li><a href="">长白山</a></li>
				<li><a href="">长春</a></li>
				<li><a href="">延吉</a></li>
				<li><a href="">雾凇岛</a></li>
				<li><a href="">集安</a></li>
				<li><a href="">吉林市</a></li>
				<li><a href="">查干湖</a></li>
				<li><a href="">三角龙湾</a></li>
				<li><a href="">通化</a></li>
				<li><a href="">四平</a></li>
				<li><a href="">松原</a></li>
				<li><a href="">白城</a></li>
			</ul>
			</br>
			<h1>吉林省简称“吉”，省会长春市。地处东经122-131度、北纬41-46度之间，面积18.74万平方公里，占全国面积2%。位于中国东北中部，处于日本、俄罗斯、朝鲜、韩国、蒙古与中国东北部组成的东北亚几何中心地带。北接黑龙江省，南接辽宁省，西邻内蒙古自治区，东与俄罗斯接壤，东南部以图们江、鸭绿江为界，与朝鲜民主主义人民共和国隔江相望。东西长650公里，南北宽300公里。东南部高，西北部低，中西部是广阔的平原。
                吉林省气候属温带季风气候，有比较明显的大陆性。夏季高温多雨，冬季寒冷干燥。吉林是中国重要的工业基地，加工制造业比较发达，汽车与石化、农产品加工为三大支柱产业，装备制造、光电子信息、医药、冶金建材、轻工纺织具有自身优势特色。 吉林省辖长春（副省级市）、吉林、四平、松原、白城、辽源、通化、白山和延边朝鲜族自治州。另直管梅河口、公主岭2个县级市。
                2018年8月，吉林省出台《关于推进避暑休闲产业创新发展的实施意见》提出，到2020年，吉林将基本建设成为国内首选的避暑休闲名省，建成避暑名城10个以上，打造特色避暑名镇20个以上。</h1>
		</div>
	</div>
	<div class="mapTipText mapTipText2">
		<div class="mapTipImg"><img src="image/liaoning.jpg" alt=""/></div>
		<div class="mapTipList">
			<h2><a href="">辽宁<span>Liaoning</span></a></h2>
			<ul>
				<li><a href="">大连</a></li>
				<li><a href="">丹东</a></li>
				<li><a href="">沈阳</a></li>
				<li><a href="">兴城</a></li>
				<li><a href="">葫芦岛</a></li>
				<li><a href="">绥中</a></li>
				<li><a href="">旅顺</a></li>
				<li><a href="">锦州</a></li>
				<li><a href="">抚顺</a></li>
				<li><a href="">鞍山</a></li>
				<li><a href="">本溪</a></li>
				<li><a href="">营口</a></li>
				<li><a href="">盘锦</a></li>
				<li><a href="">长兴岛</a></li>
			</ul>
			</br>
			<h1>辽宁省，简称"辽"，省会沈阳，辖14个地级市，其中副省级城市2个(沈阳、大连)，位于中国东北地区南部，南临黄海、渤海，东与朝鲜一江之隔，与日本、韩国隔海相望，是东北地区唯一的既沿海又沿边的省份，也是东北及内蒙古自治区东部地区对外开放的门户。
                辽宁省地势大致为自北向南，自东西两侧向中部倾斜，山地丘陵分列东西两厢，向中部平原下降，呈马蹄形向渤海倾斜，由山地、丘陵、平原构成；地跨辽河、浑河、大凌河、太子河、绕阳河、鸭绿江六大水系，属温带季风气候。
                辽宁是中国重要的老工业基地，是全国工业门类较为齐全的省份之一，是中国最早实行对外开放政策的沿海省份之一，也是中国近代开埠最早的省份之一，是中华民族和中华文明的发源地之一，新中国工业崛起的摇篮，被誉为"共和国长子"、"东方鲁尔"。2013年8月31日在辽宁召开了全国第十二届运动会，吉祥物为斑海豹"宁宁"。</h1>
		</div>
	</div>
	<div class="mapTipText mapTipText12">
		<div class="mapTipImg"><img src="image/hubei.jpg" alt=""/></div>
		<div class="mapTipList">
			<h2><a href="">湖北<span>Hubei</span></a></h2>
			<ul>
				<li><a href="">咸宁</a></li>
				<li><a href="">武汉</a></li>
				<li><a href="">鄂州</a></li>
				<li><a href="">恩施</a></li>
				<li><a href="">仙桃</a></li>
				<li><a href="">襄阳</a></li>
				<li><a href="">黄石</a></li>
				<li><a href="">宜昌</a></li>
				<li><a href="">孝感</a></li>
				<li><a href="">黄冈</a></li>
				<li><a href="">十堰</a></li>
				<li><a href="">荆州</a></li>
				<li><a href="">潜江</a></li>
				<li><a href="">天门</a></li>
				<li><a href="">洪湖</a></li>
			    <li><a href="">赤壁</a></li>
				<li><a href="">神农架林区</a></li>
			</ul>
			</br>
			<h1>湖北，简称“鄂”，中华人民共和国省级行政区。省会武汉，位于中国中部地区，东邻安徽，西连重庆，西北与陕西接壤，南接江西、湖南，北与河南毗邻，介于北纬29°01′53″—33°6′47″、东经108°21′42″—116°07′50″之间，东西长约740千米，总面积18.59万平方千米，占中国总面积的1.94%。
                湖北省地势大致为东、西、北三面环山，中间低平，略呈向南敞开的不完整盆地。在全省总面积中，山地占56%，丘陵占24%，平原湖区占20%，属长江水系。
                截至2018年末，湖北省下辖12个地级市、1个自治州、25个县级市、36个县、2个自治县、1个林区</h1>
		</div>
	</div>
	<div class="mapTipText mapTipText24">
    		<div class="mapTipImg"><img src="image/beijing.jpg" alt=""/></div>
    		<div class="mapTipList">
    			<h2><a href="">北京<span>Beijing</span></a></h2>
    			<ul>
    				<li><a href="">海淀区</a></li>
    				<li><a href="">朝阳区</a></li>
    				<li><a href="">石景山区</a></li>
    				<li><a href="">东城区</a></li>
    				<li><a href="">怀柔区</a></li>
    				<li><a href="">平谷区</a></li>
    				<li><a href="">门头沟区</a></li>
    				<li><a href="">顺义区</a></li>
    				<li><a href="">密云区</a></li>
    				<li><a href="">大兴区</a></li>
    				<li><a href="">门头沟区</a></li>
    			</ul>
    			</br>
    			<h1>北京（Beijing），简称京，古称燕京、北平，中华人民共和国首都、直辖市、国家中心城市、超大城市，全国政治中心、文化中心、国际交往中心、科技创新中心，是中国共产党中央委员会、中华人民共和国中央人民政府和全国人民代表大会的办公所在地。
                    北京位于东经115.7°—117.4°，北纬39.4°—41.6°，中心位于北纬39°54′20″，东经116°25′29″，总面积16412平方千米。北京位于中国华北平原北部，背靠燕山，毗邻天津市和河北省。北京的气候为典型的北温带半湿润大陆性季风气候。
                    北京历史悠久，文化灿烂，是首批国家历史文化名城、中国四大古都之一和世界上拥有世界文化遗产数最多的城市，3060年的建城史孕育了故宫、天坛、八达岭长城、颐和园等众多名胜古迹。早在七十万年前，北京周口店地区就出现了原始人群部落“北京人”。公元前1045年，北京成为蓟、燕等诸侯国的都城。公元938年以来，北京先后成为辽陪都、金中都、元大都、明、清国都、中华民国北洋政府首都，1949年10月1日成为中华人民共和国首都。2019年1月11日，北京市级行政中心正式迁入北京城市副中心。
                    北京被世界城市研究机构GaWC评为世界一线城市。联合国报告指出北京人类发展指数居中国城市第二位。2020年，北京市全年实现地区生产总值36102.6亿元，按可比价格计算，比上年增长1.2%。</h1>
    		</div>
    	</div>
    	<div class="mapTipText mapTipText33">
            		<div class="mapTipImg"><img src="image/macau.jpg" alt=""/></div>
            		<div class="mapTipList">
            			<h2><a href="">澳门<span>Macau</span></a></h2>
            			<ul>
            				<li><a href="">澳门半岛</a></li>
            				<li><a href="">氹仔岛</a></li>
            				<li><a href="">路环岛</a></li>
            				<li><a href="">路氹城</a></li>
            			</ul>
            			</br>
            			<h1>澳门(Macau)，全称为中华人民共和国澳门特别行政区。北邻广东省珠海市，西与珠海市的湾仔和横琴对望，东与香港隔海相望，相距60公里，南临南中国海。
                            1553年，葡萄牙人取得澳门居住权，1887年12月1日，葡萄牙与清朝政府签订《中葡会议草约》和《中葡和好通商条约》，
                            正式通过外交文书的手续占领澳门并将此辟为殖民地。1999年12月20日中国政府恢复对澳门行使主权。经过400多年欧洲文明的洗礼，东西方文化的融合共存使澳门成为一个风貌独特的城市，留下了大量的历史文化遗迹。
                            澳门历史城区于2005年7月15日正式成为联合国世界文化遗产。澳门回归中国之后，经济迅速增长，比往日更繁荣，是一国两制的成功典范。
                            澳门是一个国际自由港，是世界人口密度最高的地区之一，也是世界四大赌城之一。其著名的轻工业、旅游业、酒店业和娱乐场使澳门长盛不衰，成为全球最发达、富裕的地区之一</h1>
            		</div>
            	</div>
            	<div class="mapTipText mapTipText32">
                            		<div class="mapTipImg"><img src="image/taiwan.jpg" alt=""/></div>
                            		<div class="mapTipList">
                            			<h2><a href="">台湾<span>Taiwan</span></a></h2>
                            			<ul>
                            				<li><a href="">台北</a></li>
                            				<li><a href="">高雄</a></li>
                            				<li><a href="">基隆</a></li>
                            				<li><a href="">新竹</a></li>
                                            <li><a href=""> 嘉义</a></li>
                            			</ul>
                            			</br>
                            			<h1>台湾（Taiwan），简称“台”，是中华人民共和国省级行政区，省会台北，位于中国大陆东南海域，东临太平洋，西隔台湾海峡与福建省相望，南界巴士海峡与菲律宾群岛相对。台湾省由中国第一大岛台湾岛和周围属岛以及澎湖列岛两大岛群，共80余个岛屿所组成，总面积3.6万平方公里。台湾省人口约2350万，超过70%集中在台湾岛西部的5大都会区，其中以台北市为中心的台北都会区最大。
                                            台湾是中国领土不可分割的一部分。台湾省主要的少数民族高山族在17世纪汉族移入前即已在此定居；自明末清初始有大量的福建南部和广东东部人民移垦台湾，最终形成以汉族为主体的社会。南宋澎湖属福建路；元、明在澎湖设巡检司；明末被荷兰和西班牙侵占；1662年郑成功收复；清代1684年置台湾府，属福建省，1885年台湾建省；1895年清政府以《马关条约》割让与日本；1945年中国人民抗日战争胜利后，中国政府重新恢复了台湾省的行政管理机构；1949年国民党当局退据台湾，1954年美国同台湾当局签订《共同防御条约》，造成台湾同祖国大陆分离的状况。
                                            台湾自1960年代起推行出口导向型工业化战略，经济社会发展突飞猛进，名列亚洲四小龙之一，于1990年代跻身发达经济体之列。台湾制造业与高新技术产业发达，在半导体、IT、通讯、电子精密制造等领域领先全球。
                                            台湾文化以中华文化为主体，是中华文化的重要组成部分，高山族的南岛文化亦有影响，近现代又融合日本和欧美文化，呈现多元风貌。</h1>
                            		</div>
                            	</div>
                            	<div class="mapTipText mapTipText28">
                                         <div class="mapTipImg"><img src="image/xinjiang.jpg" alt=""/></div>
                                                   <div class="mapTipList">
                                                 <h2><a href="">新疆<span>Xinjiang</span></a></h2>
                                                         <ul>
                                                      	<li><a href="">乌鲁木齐市</a></li>
                                                       	<li><a href="">哈密地区</a></li>
                                                        <li><a href="">吐鲁番地区</a></li>
                                                         <li><a href="">喀什地区</a></li>
                                                         <li><a href=""> 伊犁哈萨克自治州 </a></li>
                                                          <li><a href=""> 阿勒泰地区 </a></li>
                                                           <li><a href=""> 图木舒克市 </a></li>
                                                            </ul>
                                                            </br>
         <h1>新疆维吾尔自治区，简称新疆，位于中国西北边陲，首府乌鲁木齐，是中国五个少数民族自治区之一，也是中国陆地面积最大的省级行政区，面积166万平方公里，占中国国土总面积六分之一。
             新疆地处亚欧大陆腹地，陆地边境线5600多公里，周边与俄罗斯、哈萨克斯坦、吉尔吉斯斯坦、塔吉克斯坦、巴基斯坦、蒙古、印度、阿富汗斯坦八国接壤，在历史上是古丝绸之路的重要通道，现在是第二座“亚欧大陆桥”的必经之地，战略位置十分重要。新疆现有47个民族成分，主要居住有维吾尔、汉、哈萨克、回、蒙古、柯尔克孜、锡伯、塔吉克、乌兹别克、满、达斡尔、塔塔尔、俄罗斯等民族，是中国五个少数民族自治区之一。
           新疆自汉朝以来就是中国不可分割的一部分，是中国神圣领土的一部分。公元前60年，西汉中央政权设立西域都护府，新疆正式成为中国领土的一部分。1884年清政府在新疆设省。1949年新疆和平解放。1955年10月1日成立新疆自治区，新疆现有14个地、州、市，89个县（市），其中33个为边境县（市）。</h1>
                                                    </div>
                                                        </div>
                   <div class="mapTipText mapTipText29">
                <div class="mapTipImg"><img src="image/xizang.jpg" alt=""/></div>
                        <div class="mapTipList">
                    <h2><a href="">西藏<span>Xizang</span></a></h2>
                                        <ul>
                   	<li><a href="">昌都地区</a></li>
                      <li><a href="">林芝地区</a></li>
                      <li><a href="">山南地区</a></li>
                      <li><a href="">林芝地区</a></li>
                      <li><a href="">日喀则地区</a></li>
                      <li><a href="">那曲地区</a></li>
                      <li><a href="">阿里地区</a></li>

                                    </ul>
                              </br>
                          <h1>西藏自治区（藏文：བོད་རང་སྐྱོང་ལྗོངས།，藏语拼音：Poi Ranggyong Jong，威利：Bod rang skyong ljongs），古称“蕃”，简称“藏”，首府拉萨，是中国五个少数民族自治区之一。
                              位于中国青藏高原西南部，地处北纬26°50′至36°53′，东经78°25′至99°06′之间。北邻新疆维吾尔自治区，东连四川省，东北紧靠青海省，东南连接云南省，南与缅甸、印度、不丹、尼泊尔等国家毗邻，西与克什米尔地区接壤，陆地国界线4000多公里，南北最宽900多公里，东西最长达2000多公里，是中国西南边陲的重要门户，无出海口。
                              全区面积120.223万平方公里，约占全国总面积的1/8，在全国各省、市、自治区中仅次于新疆。平均海拔在4000米以上，素有“世界屋脊”之称。2012年末全区常住人口总数为308万人， 辖4个地级市、3个地区，4个市辖区、72个县。
                              藏族人民是中华民族大家庭中的重要一员。西藏唐宋时期称为“吐蕃”，元明时期称为“乌斯藏”，清代称为“唐古特”、“图伯特”等。清朝康熙年间起称“西藏”至今。
                              2019年12月23日，西藏已基本消除绝对贫困，全域实现整体脱贫。</h1>
                                                </div>
                                  </div>
</div>
</div>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';clear:both;">
</div>
</body>
</html>
