<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   	<link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    <title>약관 동의</title>
    <style>
        .container {
            margin: 0 auto;
            text-align: left;
        }
        .terms-list {
            text-align: left;
            margin-top: 20px;
            font-size: 20px;
        }
        .terms-list div {
            margin-bottom: 10px;
        }
        .terms-list input {
            margin-right: 10px;
        }
        .next-button {
            margin-top: 20px;
        }
        .allterms {
            font-size: 25px;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .next-button {
        	border: 1px solid white;
        	padding: 10px 25px;
        }
    </style>
    <script>
        function toggleAllCheckboxes(source) {
            const checkboxes = document.querySelectorAll('.terms-list input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.checked = source.checked;
            });
        }

        function validateForm() {
            const requiredCheckboxes = document.querySelectorAll('.terms-list .required input[type="checkbox"]');
            for (let checkbox of requiredCheckboxes) {
                if (!checkbox.checked) {
                    alert('필수 항목에 모두 동의해야 합니다.');
                    return false;
                }
            }
            return true;
        }

        function showModal(termId) {
            document.getElementById('modal-' + termId).style.display = "block";
        }

        function closeModal(termId) {
            document.getElementById('modal-' + termId).style.display = "none";
        }
    </script>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
<br /><br />
    <div class="container">
        <h1 class="display-5 fw-bold">L!FE 약관에 동의해 주세요</h1><br />
        <div>
            <input type="checkbox" id="selectAll" onclick="toggleAllCheckboxes(this)">
            <label class="allterms" for="selectAll">모두 동의</label>
        </div>
        <form method="POST" onsubmit="return validateForm()" action="<c:url value='/user/addUser.jsp'/>">
            <div class="terms-list">
                <div class="required">
                    <input type="checkbox" id="term1" name="terms" value="term1">
                    <label for="term1">(필수) 이용약관 동의 <a href="javascript:void(0)" onclick="showModal('term1')">보기</a></label>
                </div>
                <div class="required">
                    <input type="checkbox" id="term2" name="terms" value="term2">
                    <label for="term2">(필수) 개인정보 항목 수집 및 이용 동의 <a href="javascript:void(0)" onclick="showModal('term2')">보기</a></label>
                </div>
                <div>
                    <input type="checkbox" id="term3" name="terms" value="term3">
                    <label for="term3">(선택) 개인정보 항목 수집 및 이용 동의 <a href="javascript:void(0)" onclick="showModal('term3')">보기</a></label>
                </div>
                <div>
                    <input type="checkbox" id="term4" name="terms" value="term4">
                    <label for="term4">(선택) 마케팅/광고 활용 동의 <a href="javascript:void(0)" onclick="showModal('term4')">보기</a></label>
                </div>
                <div>
                    <input type="checkbox" id="term5" name="terms" value="term5">
                    <label for="term5">(선택) 제3자 개인정보 제공 동의(L!FE) <a href="javascript:void(0)" onclick="showModal('term5')">보기</a></label>
                </div>
            </div>
            <div>
                <button class="next-button bg-primary text-white" type="submit">다음</button>
            </div>
        </form>
    </div>
    </main>
    <jsp:include page="/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>

    <!-- Modals for terms -->
    <div id="modal-term1" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('term1')">&times;</span>
            <h1>(필수)이용약관 동의</h1>
            <h3>1장 총칙</h3>
            <br />
            <h3>제1조 목적</h3>
            <p>본 약관은 L!FE 주식회사(이하 "회사"라 합니다)가 제공하는 L!FE 서비스의 이용과 관련하여
            회원의 기본적인 권리와 책임 및 회사와의 중요 사항을 정하는 것을 목적으로 합니다.</p>
            <h3>제2조 효력 및 적용 등</h3>
            <p>(1)회사는 본 약관의 내용을 회원이 쉽게 알 수 있도록 회원 가입 절차 및 서비스 화면에 게시합니다.</p>
            <p>(2)본 약관의 내용은 L!FE 서비스애 공지함으로써 효력이 발생합니다. 본 약관에 동의하고 회원 가입을 한 회원은 약관에 동의한 시점부터 동의한 약관의 적용을 받게 되고
            약관이 개정된 경우에는 개정 약관의 효력이 발생한 시점부터 변경된 약관의 적용을 받습니다.</p>
            <p>(3)회사는 약관의 규제에 관한 법률, 전자거래기본법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 소비자보호법 등 관련 법령을 위반하지 않고
            회원의 정당한 권리를 부당하게 침해하지 않는 범위 내에서 본 약관을 개정할 수 있습니다.</p>
            <p>(4)회사가 약관을 변경할 경우에는 적용일자 및 변경사유를 명시하여 현행약관과 함께 서비스 초기 화면에 그 적용일자 10일 이전부터 적용일자 이후 상당한 기간동안 공지합니다.
            다만, 회원의 권리 또는 의무에 중요한 규정의 변경은 최소한 30일 전에 공지하고 변경될 약관, 적용일자 및 변경사유를 회원이 등록한 전자우편주소로 발송합니다. 기존 회원에게는 전자우편주소로 발송합니다.</p>
            <p>(5)회사가 약관 개정 내용을 공지 또는 통지하면서 회원에게 30일 이내에 거부 의사를 표시하지 않으면 의사 표시가 표명된 것으로 본다는 뜻을 공지 또는 통지하였음에도 불구하고
            회원이 명시적으로 거부 의사를 표시하지 않으면 회원이 개정 약관에 동의한 것으로 간주합니다.</p>
            <h3>제3조 약관 외 준칙</h3>
            <p>본 약관에 명시되지 않은 사항에 대해서는 관련 법령, 회사가 정한 서비스의 개별 이용 약관, 세부 이용 지침 및 규칙 등의 규정을 따르게 됩니다.</p>
            <h3>제4조 용어 정의</h3>
            <p>본 약관에서 사용하는 용어의 정의는 다음 각 호와 같습니다.</p>
            <p>(1)"회원"이라 함은 사이트에 접속하여 이 약관에 동의함으로써 회사와 서비스 이용계약을 체결하고 이용자 ID(이용자고유번호)와 Password(비밀번호)를 발급 받은 자를 말합니다.</p>
            <p>(2)"이용자 ID"라 함은 회원 식별과 서비스 이용을 위하여 회원이 선정하고 회사가 승인하여 부여하는 문자와 숫자의 조합을 말합니다.</p>
            <p>(3)"PASSWORD(비밀번호)"라 함은 서비스 이용 시 이용자 ID와 일치하는 이용자임을 확인하고, 회원의 개인정보 보호를 위하여, 회원 자신이 설정, 관리하는 문자와 숫자의 조합을 말합니다.</p>
            <p>(4)"회원 정보"라 함은 이용자가 회사와 이용 계약 체결 시 회사에 등록하는 이용자 ID, 성명, 주소 등 이용자의 신상에 관련된 정보를 말합니다.</p>
            <p>(5)"강의 서비스"라 함은 사이트를 통해 제공되는 강의 서비스를 말하며 그 이용 등에 관한 구체적인 사항은 본 약관 제15조에 기술된 바와 같습니다.</p>
            <p>... 이하 생략</p>
        </div>
    </div>
    <div id="modal-term2" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('term2')">&times;</span>
            <h1>(필수)개인정보 항목 수집 및 이용 동의</h1>
            <table border="1">
            	<tr>
            		<th>구분</th>
            		<th>수집하는 개인정보 항목</th>
            		<th>수집 및 이용 목적</th>
            		<th>보유 및 이용 기간</th>
            	</tr>
            	<tr>
            		<td>L!FE서비스회원가입시</td>
            		<td>아이디, 비밀번호, 이름, 생년월일, 학년, 이메일, 휴대폰번호</td>
            		<td>-본인확인 및 가입의사 확인 -L!FE 계정 기반 회원제 서비스 제공 - 법정대리인 동의 여부 확인(*단 학부모·일반 회원 경우) -L!FE회원관리 및 서비스 운영</td>
            		<td>회원 탈퇴시 14일간 보관 후 파기, 아이디는 중복 가입 및 부정이용 이슈 방지를 위해 14일 보관 후 파기(단, 관련 법령에 따라 보존이 필요한 경우 보관기간 경과 후 파기)</td>
            	</tr>
            	<tr>
            		<td>강사채용시</td>
            		<td>사진, 이름, 생년월일, 성별, 휴대폰번호, 이메일, 주소, 학력사항(최종학력, 교원자격증 유무, 학교명, 전공, 재학기간, 이수 형태)</td>
            		<td>-채용 지원 및 채용 이력관리 - 상시 채용 실시를 위한 인적 자원관리</td>
            		<td>채용 전형 종료 후 지체 없이 파기</td>
            	</tr>
            	<tr>
            		<td>서비스부정이용사용방지</td>
            		<td>-MAC Address, HDD Serial, 모바일 기기 고유번호(IMEI, UUID)</td>
            		<td>각 계정별, 디바이스 1대 등록 식별</td>
            		<td>법령이 정하는 경우를 제외하고는 회원 탈퇴시까지 보유 및 이용합니다. 쿠키의 경우 로그아웃 또는 브라우저 종료 시 삭제됩니다.</td>
            	</tr>
            </table>
            <p>* 이용자는 동의를 거부할 권리가 있으나, 동의를 거부하는 경우 회원가입 및 서비스의 이용이 제한됩니다.</p>
        </div>
    </div>
    <div id="modal-term3" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('term3')">&times;</span>
            <h1>(선택)개인정보 항목 수집 및 이용 동의</h1>
            <table border="1">
            	<tr>
            		<th>구분</th>
            		<th>수집하는 개인정보 항목</th>
            		<th>수집 및 이용 목적</th>
            		<th>보유 및 이용 기간</th>
            	</tr>
            	<tr>
            		<td>L!FE서비스회원가입시</td>
            		<td>주소, 학교</td>
            		<td>-L!FE 계정 기반 회원제 서비스 제공 -L!FE회원관리 및 서비스 운영</td>
            		<td>회원 탈퇴시 14일간 보관 후 파기, 아이디는 중복 가입 및 부정이용 이슈 방지를 위해 14일 보관 후 파기(단, 관련 법령에 따라 보존이 필요한 경우 보관기간 경과 후 파기)</td>
            	</tr>
            </table>
            <p> * 귀하는 개인정보 선택항목 수집 및 이용에 동의하지 않으셔도 회원가입 및 서비스 이용에 불이익은 없습니다.</p>
        </div>
    </div>
    <div id="modal-term4" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('term4')">&times;</span>
            <h1>(선택)마케팅/광고 활용 동의</h1>
            <table border="1">
            	<tr>
            		<th>수집 및 이용 목적</th>
            		<th>수집하는 개인정보 항목</th>
            		<th>보유 및 이용 기간</th>
            	</tr>
            	<tr>
            		<td>-서비스 이용 안내 및 홍보/아밴트/프로모션 발송 및 홍보 -고객맞춤정보 제공</td>
            		<td>이메일, 휴대전화번호, 가입 정보</td>
            		<td>회원 탈퇴 시(위탁업무 종료 시 파기)</td>
            	</tr>
            	<tr>
            		<td>-L!FE 이용자의 행태정보 기반 타겟 마케팅 제공</td>
            		<td>개인 정보와 결합된 쿠키 기반 웹/앱 서비스 방문 기록, 검색, 클릭 등 사용 기록, 접속 기기 정보 및 운영 체제 정보</td>
            		<td>수집일로부터 최대 3년간 보유·이용되며, 이용 기간 종료 시 행태 정보는 지체 없이 파기</td>
            	</tr>
            </table>
            <p>※ 당사에서 제공하는 이벤트 등 다양한 정보를 카카오톡, SMS, MMS, 이메일 등으로 받아보실 수 있습니다.</p>
            <br />
            <p>※ 동의 철회를 위한 안내</p>
            <p>귀하는 광고성 정보 수신 동의를 거부할 권리가 있습니다. 동의하지 않더라도 당사 서비스 이용이 가능합니다. 당사에서 제공하는 광고성 정보를 원치 않으실 경우
            사이트 내 수신 철회 설정 또는 고객센터를 통해 철회요청을 하실 수 있습니다.</p>
            <br />
            <p>※ 고객이 브라우저 설정을 조정하여 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 본 마케팅/광고 활용 동의서에 동의를 했어도
            고객이 모든 쿠키 거부 설정을 통한 온라인 행태정보의 수집을 차단하신 경우에는 고객의 개인정보와 결합된 행태 정보 기반의 타겟 마케팅(광고성 정보)은 절대 제공되지 않습니다.
            단, 이용자가 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있으므로 주의가 필요합니다.</p>
        </div>
    </div>
    <div id="modal-term5" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('term5')">&times;</span>
            <h1>(선택)제3자 개인정보 제공 동의(L!FE ECI)</h1>
            <p>개인정보의 제공 및 공유 회사는 이용자들의 개인정보를 "개인정보의 수집 및 이용 목적"에 고지한 범위에 한해서만 사용하며, 이용자의 동의 없이는 동범위를 초과하여 이용하거나 원칙저긍로 개인정보를 외부에 공개하지 않습니다. 단, 다음의 경우는 예외로 합니다.</p>
            <p>가. 이용자들이 사전에 동의한 경우 개인정보 제공 이전에 개인정보 제공자, 개인정보 제공 목적, 제공하는 개인정보의 항목 및 보유기간을 별도로 알리고 동의절차를 거치며,
            이에 이용자가 동의하지 않을 경우에는 제3자에게 이용자의 개인정보를 제공하지 않습니다.</p>
            <p>나. 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</p>
            <p>다. 제3자 제공에 동의한 경우, 해당 서비스 제공 업체에 아래의 개인정보가 제공됩니다.</p>
            <table border="1">
            	<tr>
            		<th>제공받는 자</th>
            		<th>제공받는 자의 개인정보 이용 목적</th>
            		<th>제공하는 개인정보의 항목</th>
            		<th>제공받는 자의 개인정보 보유 및 이용 기간</th>
            	</tr>
            	<tr>
            		<td>L!FE ECI(주)</td>
            		<td>-L!FE 서비스 제공 -학습상담</td>
            		<td>-L!FE 회원 가입 정보 -수강 이력</td>
            		<td>L!FE 서비스 동의 철회 및 서비스 탈퇴 시까지</td>
            	</tr>
            </table>
            <p>1) 제3자 제공 업무 발생 시, 필요 시점에 이용자에게 별도로 알리고 동의절차가 진행됩니다.</p>
            <p>2) 제3자 제공 동의를 거부하실 수 있으며, 언제든지 제3자 제공 동의를 철회할 수 있습니다.</p>
            <p>3) 이용자는 회원을 위한 제3자 제공 및 활용에 동의를 거부할 권리가 있으나, 미 동의 시 회원가입 및 서비스 이용에 제한이 있을 수 있습니다.</p>
        </div>
      </div>
</body>
</html>
