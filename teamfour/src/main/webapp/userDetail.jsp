<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subtop2.jsp"%>
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/css/default_shop.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/js/font-awesome/css/font-awesome.min.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/js/owlcarousel/owl.carousel.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/outlogin/shop_basic/style.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/outlogin/shop_side/style.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/shop/basic/style.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/latest/notice/style.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/visit/shop_basic/style.css?ver=220620">
<div id="wrapper" class="">
    <!-- #container 시작 { -->
    <div id="container">

                        <!-- .shop-content 시작 { -->
        <div class="shop-content">
            <div id="wrapper_title">마이페이지</div>            
            <!-- 글자크기 조정 display:none 되어 있음 시작 { -->
            <div id="text_size">
                <button class="no_text_resize" onclick="font_resize('container', 'decrease');">작게</button>
                <button class="no_text_resize" onclick="font_default('container');">기본</button>
                <button class="no_text_resize" onclick="font_resize('container', 'increase');">크게</button>
            </div>
            <!-- } 글자크기 조정 display:none 되어 있음 끝 -->
            
<jsp:useBean id="userInfoService" class="com.userinfo.model.UserInfoService"
scope="session"></jsp:useBean>
<jsp:useBean id="userInfoVo" class="com.userinfo.model.UserInfoVO"
scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");

	String userinfo = (String)session.getAttribute("d_userid");
	if(userinfo!=null || !userinfo.isEmpty()){
		userInfoVo=userInfoService.selectUser(userinfo);
	}else{%>
	<script type="text/javascript">
		location.href='mainpage.jsp';
	</script>
<% }	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

%>
<!-- 마이페이지 시작 { -->
<div id="smb_my">

    <!-- 회원정보 개요 시작 { -->
    <section id="smb_my_ov">
        <h2>회원정보 개요</h2>
        
        <div class="smb_me">
	        <strong class="my_ov_name">
	        <img src="https://demo.sir.kr/gnuboard5/img/no_profile.gif" alt="profile_image">
	        <br><%=userInfoVo.getUser_nick() %></strong><br>
	        <a href="https://demo.sir.kr/gnuboard5/bbs/member_confirm.php?url=register_form.php" 
	        	class="smb_info">정보수정</a>
	        <a href="https://demo.sir.kr/gnuboard5/bbs/logout.php">로그아웃</a>
        </div>
        
        <h3>내정보</h3>
        <dl class="op_area">
            <dt>연락처</dt>
            <dd><%=userInfoVo.getUser_tel() %></dd>
            <dt>E-Mail</dt>
            <dd><%=userInfoVo.getUser_email() %></dd>
            <dt>회원가입일시</dt>
            <dd><%=sdf.format(userInfoVo.getUser_joindate()) %></dd>
            <dt id="smb_my_ovaddt">주소</dt>
            <dd id="smb_my_ovaddd"><%=userInfoVo.getUser_address() %></dd>
        </dl>
        
        <a href="deleteUser.jsp" class="withdrawal">회원탈퇴</a>
    </section>
    <!-- } 회원정보 개요 끝 -->

	<div id="smb_my_list">
	    <!-- 최근 주문내역 시작 { -->
	    <section id="smb_my_od">
	        <h2>주문내역조회</h2>
	        <h3>주분번호를 클릭하면 상세 주문내역을 확인할 수 있습니다.</h3>
	        
<!-- 주문 내역 목록 시작 { -->

<div class="tbl_head03 tbl_wrap">
    <table>
    <thead>
    <tr>
        <th scope="col">주문서번호</th>
        <th scope="col">주문일시</th>
        <th scope="col">상품수</th>
        <th scope="col">주문금액</th>
        <th scope="col">입금액</th>
        <th scope="col">미입금액</th>
        <th scope="col">상태</th>
    </tr>
    </thead>
    <tbody>
    
    <tr>
        <td>
            <a href="https://demo.sir.kr/gnuboard5/shop/orderinquiryview.php?od_id=2022110601203274&amp;uid=e7d60677743329fc8fda7373036889e6">2022110601203274</a>
        </td>
        <td>22-11-06 01:21 (일)</td>
        <td class="td_numbig">2</td>
        <td class="td_numbig text_right">350,000원</td>
        <td class="td_numbig text_right">0원</td>
        <td class="td_numbig text_right">350,000원</td>
        <td><span class="status_01">입금확인중</span></td>
    </tr>

    
    <tr>
        <td>
            <a href="https://demo.sir.kr/gnuboard5/shop/orderinquiryview.php?od_id=2022110320214798&amp;uid=040c3813b99e2e1bdd053bad19f97bdb">2022110320214798</a>
        </td>
        <td>22-11-03 20:26 (목)</td>
        <td class="td_numbig">1</td>
        <td class="td_numbig text_right">1,700원</td>
        <td class="td_numbig text_right">1,700원</td>
        <td class="td_numbig text_right">0원</td>
        <td><span class="status_02">입금완료</span></td>
    </tr>

    
    <tr>
        <td>
            <a href="https://demo.sir.kr/gnuboard5/shop/orderinquiryview.php?od_id=2022110320171218&amp;uid=8c1697df7fcf80a4a890b4f1be1dc0b6">2022110320171218</a>
        </td>
        <td>22-11-03 20:18 (목)</td>
        <td class="td_numbig">1</td>
        <td class="td_numbig text_right">1,700원</td>
        <td class="td_numbig text_right">1,700원</td>
        <td class="td_numbig text_right">0원</td>
        <td><span class="status_02">입금완료</span></td>
    </tr>

    
    <tr>
        <td>
            <a href="https://demo.sir.kr/gnuboard5/shop/orderinquiryview.php?od_id=2022110319521485&amp;uid=b4e84bcb09630b44a58967159c8620c6">2022110319521485</a>
        </td>
        <td>22-11-03 20:15 (목)</td>
        <td class="td_numbig">1</td>
        <td class="td_numbig text_right">1,700원</td>
        <td class="td_numbig text_right">1,700원</td>
        <td class="td_numbig text_right">0원</td>
        <td><span class="status_02">입금완료</span></td>
    </tr>

    
    <tr>
        <td>
            <a href="https://demo.sir.kr/gnuboard5/shop/orderinquiryview.php?od_id=2022110317075751&amp;uid=d7c03a771a28ed2bac64af7b80c5e732">2022110317075751</a>
        </td>
        <td>22-11-03 17:10 (목)</td>
        <td class="td_numbig">1</td>
        <td class="td_numbig text_right">3,000원</td>
        <td class="td_numbig text_right">3,000원</td>
        <td class="td_numbig text_right">0원</td>
        <td><span class="status_02">입금완료</span></td>
    </tr>

        </tbody>
    </table>
</div>
<!-- } 주문 내역 목록 끝 -->	
	    </section>
	    <!-- } 최근 주문내역 끝 -->
	
	    <!-- 최근 위시리스트 시작 { -->
	    <section id="smb_my_wish">
	        <h2>최근 위시리스트</h2>
            <form name="fwishlist" method="post" action="./cartupdate.php">
            <input type="hidden" name="act" value="multi">
            <input type="hidden" name="sw_direct" value="">
            <input type="hidden" name="prog" value="wish">
                <ul>
                
                <li>
                    <div class="smb_my_chk">
                                                <div class="chk_box">
                            <input type="checkbox" name="chk_it_id[0]" value="1" id="chk_it_id_0" onclick="out_cd_check(this, 'no');" class="selec_chk">
                            <label for="chk_it_id_0"><span></span><b class="sound_only">TH-파스텔드레스셔츠 - 오렌지</b></label>
                        </div>
                                                <input type="hidden" name="it_id[0]" value="1387868087">
                        <input type="hidden" name="io_type[1387868087][0]" value="0">
                        <input type="hidden" name="io_id[1387868087][0]" value="">
                        <input type="hidden" name="io_value[1387868087][0]" value="TH-파스텔드레스셔츠 - 오렌지">
                        <input type="hidden" name="ct_qty[1387868087][0]" value="1">
                    </div>
                    <div class="smb_my_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1387868087"><img src="https://demo.sir.kr/gnuboard5/data/item/1387868087/thumb-44S341_100x100.jpg" width="100" height="100" alt=""></a></div>
                    <div class="smb_my_tit"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1387868087">TH-파스텔드레스셔츠 - 오렌지</a></div>
                    <div class="smb_my_price">30,000원</div>
                    <div class="smb_my_date">2022-11-04 14:35:57</div>
                    <a href="./wishupdate.php?w=d&amp;wi_id=1928" class="wish_del"><i class="fa fa-trash" aria-hidden="true"></i><span class="sound_only">삭제</span></a>
                </li>

                
                <li>
                    <div class="smb_my_chk">
                                                <div class="chk_box">
                            <input type="checkbox" name="chk_it_id[1]" value="1" id="chk_it_id_1" onclick="out_cd_check(this, 'no');" class="selec_chk">
                            <label for="chk_it_id_1"><span></span><b class="sound_only">베이직 기모 레글런 오트밀와인2</b></label>
                        </div>
                                                <input type="hidden" name="it_id[1]" value="1387871842">
                        <input type="hidden" name="io_type[1387871842][0]" value="0">
                        <input type="hidden" name="io_id[1387871842][0]" value="">
                        <input type="hidden" name="io_value[1387871842][0]" value="베이직 기모 레글런 오트밀와인2">
                        <input type="hidden" name="ct_qty[1387871842][0]" value="1">
                    </div>
                    <div class="smb_my_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1387871842"><img src="https://demo.sir.kr/gnuboard5/data/item/1387871842/thumb-t31_100x100.jpg" width="100" height="100" alt=""></a></div>
                    <div class="smb_my_tit"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1387871842">베이직 기모 레글런 오트밀와인2</a></div>
                    <div class="smb_my_price">130,000원</div>
                    <div class="smb_my_date">2022-11-04 14:23:45</div>
                    <a href="./wishupdate.php?w=d&amp;wi_id=1927" class="wish_del"><i class="fa fa-trash" aria-hidden="true"></i><span class="sound_only">삭제</span></a>
                </li>

                
                <li>
                    <div class="smb_my_chk">
                                                <div class="chk_box">
                            <input type="checkbox" name="chk_it_id[2]" value="1" id="chk_it_id_2" onclick="out_cd_check(this, 'no');" class="selec_chk">
                            <label for="chk_it_id_2"><span></span><b class="sound_only">TH-블락체크 셔츠-그레이2 [면세]</b></label>
                        </div>
                                                <input type="hidden" name="it_id[2]" value="1446772772">
                        <input type="hidden" name="io_type[1446772772][0]" value="0">
                        <input type="hidden" name="io_id[1446772772][0]" value="">
                        <input type="hidden" name="io_value[1446772772][0]" value="TH-블락체크 셔츠-그레이2 [면세]">
                        <input type="hidden" name="ct_qty[1446772772][0]" value="1">
                    </div>
                    <div class="smb_my_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1446772772"><img src="https://demo.sir.kr/gnuboard5/data/item/1446772772/thumb-7LK07YGs11_100x100.jpg" width="100" height="100" alt=""></a></div>
                    <div class="smb_my_tit"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1446772772">TH-블락체크 셔츠-그레이2 [면세]</a></div>
                    <div class="smb_my_price">31,000원</div>
                    <div class="smb_my_date">2022-10-20 09:43:23</div>
                    <a href="./wishupdate.php?w=d&amp;wi_id=1926" class="wish_del"><i class="fa fa-trash" aria-hidden="true"></i><span class="sound_only">삭제</span></a>
                </li>

                
                <li>
                    <div class="smb_my_chk">
                                                <div class="chk_box">
                            <input type="checkbox" name="chk_it_id[3]" value="1" id="chk_it_id_3" onclick="out_cd_check(this, 'no');" class="selec_chk">
                            <label for="chk_it_id_3"><span></span><b class="sound_only">TH-베이직 슬림셔츠 블랙</b></label>
                        </div>
                                                <input type="hidden" name="it_id[3]" value="1387870218">
                        <input type="hidden" name="io_type[1387870218][0]" value="0">
                        <input type="hidden" name="io_id[1387870218][0]" value="">
                        <input type="hidden" name="io_value[1387870218][0]" value="TH-베이직 슬림셔츠 블랙">
                        <input type="hidden" name="ct_qty[1387870218][0]" value="1">
                    </div>
                    <div class="smb_my_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1387870218"><img src="https://demo.sir.kr/gnuboard5/data/item/1387870218/thumb-44WF21_100x100.jpg" width="100" height="100" alt=""></a></div>
                    <div class="smb_my_tit"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1387870218">TH-베이직 슬림셔츠 블랙</a></div>
                    <div class="smb_my_price">340,000원</div>
                    <div class="smb_my_date">2022-10-19 12:49:59</div>
                    <a href="./wishupdate.php?w=d&amp;wi_id=1925" class="wish_del"><i class="fa fa-trash" aria-hidden="true"></i><span class="sound_only">삭제</span></a>
                </li>

                
                <li>
                    <div class="smb_my_chk">
                                                <div class="chk_box">
                            <input type="checkbox" name="chk_it_id[4]" value="1" id="chk_it_id_4" onclick="out_cd_check(this, 'no');" class="selec_chk">
                            <label for="chk_it_id_4"><span></span><b class="sound_only">TH-블락체크 셔츠-그레이2 [테스트]</b></label>
                        </div>
                                                <input type="hidden" name="it_id[4]" value="1412210417">
                        <input type="hidden" name="io_type[1412210417][0]" value="0">
                        <input type="hidden" name="io_id[1412210417][0]" value="">
                        <input type="hidden" name="io_value[1412210417][0]" value="TH-블락체크 셔츠-그레이2 [테스트]">
                        <input type="hidden" name="ct_qty[1412210417][0]" value="1">
                    </div>
                    <div class="smb_my_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1412210417"><img src="https://demo.sir.kr/gnuboard5/data/item/1412210417/thumb-7LK07YGs11_100x100.jpg" width="100" height="100" alt=""></a></div>
                    <div class="smb_my_tit"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1412210417">TH-블락체크 셔츠-그레이2 [테스트]</a></div>
                    <div class="smb_my_price">1,000원</div>
                    <div class="smb_my_date">2022-10-04 14:46:26</div>
                    <a href="./wishupdate.php?w=d&amp;wi_id=1911" class="wish_del"><i class="fa fa-trash" aria-hidden="true"></i><span class="sound_only">삭제</span></a>
                </li>

                                </ul>
        
                <div class="smb_my_more">
                    <a href="./wishlist.php">더보기</a>
                </div>
                
                <div id="smb_ws_act">
                    <button type="submit" class="btn01" onclick="return fwishlist_check(document.fwishlist,'');">장바구니</button>
                    <button type="submit" class="btn02" onclick="return fwishlist_check(document.fwishlist,'direct_buy');">주문하기</button>
                </div>
            </form>
	    </section>
	    <!-- } 최근 위시리스트 끝 -->
	</div>
</div>

<script>
function member_leave()
{
    return confirm('정말 회원에서 탈퇴 하시겠습니까?')
}

function out_cd_check(fld, out_cd)
{
    if (out_cd == 'no'){
        alert("옵션이 있는 상품입니다.\n\n상품을 클릭하여 상품페이지에서 옵션을 선택한 후 주문하십시오.");
        fld.checked = false;
        return;
    }

    if (out_cd == 'tel_inq'){
        alert("이 상품은 전화로 문의해 주십시오.\n\n장바구니에 담아 구입하실 수 없습니다.");
        fld.checked = false;
        return;
    }
}

function fwishlist_check(f, act)
{
    var k = 0;
    var length = f.elements.length;

    for(i=0; i<length; i++) {
        if (f.elements[i].checked) {
            k++;
        }
    }

    if(k == 0)
    {
        alert("상품을 하나 이상 체크 하십시오");
        return false;
    }

    if (act == "direct_buy")
    {
        f.sw_direct.value = 1;
    }
    else
    {
        f.sw_direct.value = 0;
    }

    return true;
}
</script>
<!-- } 마이페이지 끝 -->

        </div>  <!-- } .shop-content 끝 -->
	</div>      <!-- } #container 끝 -->
</div>
<!-- } 전체 콘텐츠 끝 -->

<%@ include file="../include/bottom.jsp"%>