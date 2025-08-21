<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
  <title>강의 등록</title>
  <meta charset="UTF-8" />
  <link href="${pageContext.request.contextPath}/resources/css/page/class/class_regist.css" rel="stylesheet" />
  <jsp:include page="/WEB-INF/views/inc/common_head.jsp" />
</head>
<body>

  <div class="page-base container">

    <!-- 헤더 -->
    <header>
      <jsp:include page="/WEB-INF/views/inc/header.jsp" />
    </header>
  
    <h3 class="page-title">강의 등록</h3>

    
    <article>
      <div class="register-bg">
        <div class="lecture-register-card">

         
          <form action="${pageContext.request.contextPath}/ClassRegist" method="post">

            <!-- 강의 제목 & 요약 -->
            <div class="reg-top-row">
              <div class="reg-input-group">
                <label for="lec-title" class="reg-label">강의제목</label>
                <input type="text" id="lec-title" name="class_title" class="reg-input" placeholder="제목을 입력하세요"> 
              </div>
              <div class="reg-input-group">
                <label for="lec-summary" class="reg-label">강의 요약</label>
                <input type="text" id="lec-summary" name="class_intro" class="reg-input" placeholder="강의를 간단히 소개해 주세요">
              </div>
            </div>

            <!-- 강의 카테고리 선택 -->
            <div class="reg-category-block">
              <label class="reg-label">강의 카테고리 선택</label>
              <div class="reg-category-selector">
                <div class="reg-category-col">
                  <div id="category-list" class="reg-category-col"></div>
                </div>
                <div class="reg-category-col">
                  <div id="subcategory-list" class="reg-category-col"></div>
                </div>
              </div>
              <div class="reg-chosen-tags-wrap" id="chosen-tags-wrap">
                <span class="reg-chosen-tag">
                  <button type="button" class="reg-chosen-x" aria-label="삭제">&times;</button>
                </span>
              </div>
            </div>
            
          <input type="hidden" name="class_category" id="classCategoryInput">
          <input type="hidden" name="class_level" id="classLevelInput">
          <input type="hidden" name="class_type" id="classTypeInput">

            <!-- 난이도 -->
            <div class="reg-select-group">
              <div class="reg-select-label">강의 난이도</div>
              <div class="reg-select-btns" id="difficulty-group">
                <button type="button" class="reg-toggle-btn selected" data-value="초급" aria-pressed="true">
                  <span class="chk-ico" aria-hidden="true">&#10003;</span>
                  <span>초급<br /><small>누구나 들을 수 있는</small></span>
                </button>
                <button type="button" class="reg-toggle-btn" data-value="중급" aria-pressed="false">
                  <span class="chk-ico" aria-hidden="true">&#10003;</span>
                  <span>중급<br /><small>전문 지식이 필요한</small></span>
                </button>
                <button type="button" class="reg-toggle-btn" data-value="고급" aria-pressed="false">
                  <span class="chk-ico" aria-hidden="true">&#10003;</span>
                  <span>고급<br /><small>전문성을 높이는</small></span>
                </button>
              </div>
            </div>

            <!-- 강의 유형 -->
            <div class="reg-select-group">
              <div class="reg-select-label">강의 유형</div>
              <div class="reg-select-btns" id="type-group">
                <button type="button" class="reg-toggle-btn selected" data-value="1" aria-pressed="true">
                  <span class="chk-ico" aria-hidden="true">&#10003;</span><span>현장 강의</span>
                </button>
                <button type="button" class="reg-toggle-btn" data-value="2" aria-pressed="false">
                  <span class="chk-ico" aria-hidden="true">&#10003;</span><span>온라인 강의</span>
                </button>
                <button type="button" class="reg-toggle-btn" data-value="3" aria-pressed="false">
                  <span class="chk-ico" aria-hidden="true">&#10003;</span><span>실시간 강의</span>
                </button>
              </div>

              <!-- 유형별 상세 정보 -->
              <div class="reg-info-vertical-table">
                <!-- 현장 강의 -->
                <div class="reg-info-vertical-table type-details" id="type-hyunsang" style="display:none;">
                  <div class="info-row-vertical">
                    <label for="audience-count" class="info-label-vertical">수강 인원</label>
                    <input type="number" id="audience-count" name="audienceCount" class="input-vertical" value="30" min="1" />
                  </div>
                  <div class="info-row-vertical">
                    <label for="lecture-room" class="info-label-vertical">강의장 선택</label>
                    <select id="lecture-room" name="lectureRoom" class="input-vertical">
                      <option>강의장 A</option>
                      <option>강의장 B</option>
                    </select>
                  </div>
                  <div class="info-row-vertical">
                    <label class="info-label-vertical">강의 기간</label>
                    <div class="date-range-vertical">
                      <input type="date" id="start-date" name="startDate" class="input-vertical-date">
                      <span class="date-separator">~</span>
                      <input type="date" id="class_time" name="endDate" class="input-vertical-date">
                    </div>
                  </div>
                  <div class="info-row-vertical">
                    <label for="weekdays" class="info-label-vertical">요일 선택</label>
                    <select id="weekdays" name="weekdays" class="input-vertical">
                      <option>월, 수, 금</option>
                      <option>화, 목</option>
                      <option>주말</option>
                    </select>
                  </div>
                  <div class="info-row-vertical">
                    <label for="class-time" class="info-label-vertical">시간 선택</label>
                    <select id="class-time" name="class_time" class="input-vertical">
                      <option>9:00~17:00</option>
                    </select>
                  </div>
                </div>

                <!-- 온라인 강의 -->
                <div class="reg-info-vertical-table type-details" id="type-online" style="display:none;">
                  <div class="info-row-vertical">
                    <label class="info-label-vertical">온라인 강의 URL</label>
                    <input type="url" name="onlineUrl" class="input-vertical" placeholder="강의 URL 입력" />
                  </div>
                  <div class="info-row-vertical">
                    <label class="info-label-vertical">녹화 여부</label>
                    <select name="recorded" class="input-vertical">
                      <option value="yes">예</option>
                      <option value="no">아니오</option>
                    </select>
                  </div>
                </div>

                <!-- 실시간 강의 -->
                <div class="reg-info-vertical-table type-details" id="type-live" style="display:none;">
                  <div class="info-row-vertical">
                    <label class="info-label-vertical">실시간 강의 시작일</label>
                    <input type="date" name="liveStart" class="input-vertical" />
                  </div>
                  <div class="info-row-vertical">
                    <label class="info-label-vertical">실시간 강의 종료일</label>
                    <input type="date" name="liveEnd" class="input-vertical" />
                  </div>
                </div>

                <!-- 가격 설정 -->
                <div class="price-frame">
                  <div class="price-setting">
                    <div class="price-group">
                      <span class="price-label">공급가액</span>
                      <div class="price-input-row">
                        <span class="currency-symbol">$</span>
                        <input type="number" min="0" class="price-input" id="supply-amount" name="supplyAmount" />
                      </div>
                    </div>
                    <div class="price-group sale-price">
                      <span class="price-label">판매가 <span class="vat-info">(부가세 10% 포함)</span></span>
                      <div class="price-input-row">
                        <span class="currency-symbol">$</span>
                        <input type="number" min="0" class="price-input" id="selling-amount" name="class_price" readonly />
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 수강기한 영역 -->
                <div class="period-setting">
                  <span class="period-label">수강기한</span>
                  <select id="period-select" name="period" class="period-select">
                    <option value="1">1개월</option>
                    <option value="2">2개월</option>
                    <option value="3" selected>3개월</option>
                    <option value="6">6개월</option>
                    <option value="12">12개월</option>
                  </select>
                </div>

              </div> 
			</div>		
              <!-- 버튼 -->
              <div class="d-flex flex-row button-container">
                <a href="${pageContext.request.contextPath}/lecture/list" class="negative-button">돌아가기</a>
                <button type="submit" class="positive-button">등록</button>
              </div>

          </form> 

        </div>
      </div> 
    </article>

    <!-- 푸터 -->
    <footer>
      <jsp:include page="/WEB-INF/views/inc/footer.jsp" />
    </footer>

  </div> 

  <script src="${pageContext.request.contextPath}/resources/js/class/class_regist.js"></script>

</body>
</html>
