/* 테이블 드랍*/
DROP TABLE BOARD_ACCUSATION;
DROP TABLE NOTIFICATIONS;
DROP TABLE VOTE;
DROP TABLE SUBSCRIBE;
DROP TABLE COMMENTS;
DROP TABLE FILES;
DROP TABLE VISITER;
DROP TABLE USER_ROLE;
DROP TABLE BLACKLIST;
DROP TABLE BOARD_POST;
DROP TABLE BOARD_CATEGORY;

DROP TABLE SETTLE;
DROP TABLE MATCHING;
DROP TABLE WATINGROOM;
DROP TABLE PARTY;
DROP TABLE OTT;

DROP TABLE PAYMENT;
DROP TABLE USERS;

/* 테이블 생성*/
CREATE TABLE USERS --유저
(
    user_id varchar2(20) PRIMARY KEY, --유저아이디
    pwd varchar2(100) NOT NULL, --유저비밀번호
    name varchar2(20) NOT NULL, --이름
    jnum varchar2(20) NOT NULL, --주민번호
    age number(5), --나이
    area varchar(20), --지역
    email varchar2(50) NOT NULL UNIQUE, --이메일
    regdate date NOT NULL, --등록일
    black_enabled char(1) DEFAULT 1 NOT NULL, --블랙 상태(0:블랙유저 / 1:정상
    enabeld char(1) DEFAULT 1 NOT NULL -- 유저 상태(0:탈퇴 / 1:정상) 
);

CREATE TABLE BOARD_CATEGORY --게시판 카테고리
(
    category_id number(10) PRIMARY KEY, --시퀀스
    category_name varchar2(20) NOT NULL, -- 카테고리 이름
    board_address varchar2(50) NOT NULL -- 해당 카테고리 메인 게시판 주소
);

CREATE TABLE BOARD_POST -- 게시글
(
    post_id number(10) PRIMARY KEY, --시퀀스
    user_id varchar2(20) NOT NULL, --글쓴이
    category_id number(1) NOT NULL, --카테고리번호
    title varchar2(20) NOT NULL, --글제목
    content varchar2(4000) NOT NULL, --글내용
    hit number(10) DEFAULT 0 NOT NULL, --조회수
    created_day date NOT NULL, --글 작성일
    updated_day date, -- 최종수정일
    CONSTRAINT FK_POST_USERID FOREIGN KEY(user_id) REFERENCES USERS(user_id),
    CONSTRAINT FK_POST_CATEGORY FOREIGN KEY(category_id) REFERENCES BOARD_CATEGORY(category_id)

);

CREATE TABLE USER_ROLE --유저권한
(
    role_id number(10) PRIMARY KEY, --시퀀스
    user_id varchar2(20) NOT NULL, --유저아이디
    authority varchar2(20) DEFAULT 'ROLE_MEMBER' NOT NULL, --권한
    CONSTRAINT FK_ROLE_ID FOREIGN KEY(user_id) REFERENCES USERS(user_id)
);

CREATE TABLE BLACKLIST --블랙리스트
(
    black_id number(10) PRIMARY KEY, --시퀀스
    user_id varchar2(20) NOT NULL, --블랙유저 아이디
    black_start_date date NOT NULL, --정지시작일
    black_expiry_date date NOT NULL, --정지만료일
    content varchar2(500), --정지사유
    CONSTRAINT FK_BLACK_ID FOREIGN KEY(user_id) REFERENCES USERS(user_id)
);

CREATE TABLE VISITER --사이트방문자
(
    ip_address varchar2(50), --방문자IP
    visit_date date, -- 방문시간
    CONSTRAINT PK_VISITER PRIMARY KEY(ip_address, visit_date)
);

CREATE TABLE FILES --첨부파일
(
    file_id number(10) PRIMARY KEY, --시퀀스
    post_id number(10), --첨부파일이 포함된 글번호
    file_type varchar2(2) NOT NULL, --파일종류
    file_size number(10) NOT NULL, -- 파일크기
    org_name varchar2(30) NOT NULL, --원본 파일이름
    src_name varchar2(30) NOT NULL, -- 서버에 저장된 파일이름
    created_day date NOT NULL,
    CONSTRAINT FK_FILES_POST FOREIGN KEY(post_id) REFERENCES BOARD_POST(post_id)
);

CREATE TABLE COMMENTS -- 댓글
(
    comment_id number(10) PRIMARY KEY, --댓글번호(소속 게시글에서 가장 큰 댓글번호 + 1 방식으로) 시퀀스 아님!!
    post_id number(10) NOT NULL, --댓글을 포함하고있는 글번호
    user_id varchar2(20) NOT NULL, -- 댓글을 쓴 사람아이디
    content varchar2(1000) NOT NULL, -- 댓글내용,
    ref number(10) NOT NULL, -- 대댓글기능용 jsp14_board 참고
    lev number(10) NOT NULL, 
    step number(10) NOT NULL, 
    created_day date NOT NULL, --댓글생성날짜
    updated_day date, --댓글수정날짜
    CONSTRAINT FK_COMMENTS_POST FOREIGN KEY(post_id) REFERENCES BOARD_POST(post_id),
    CONSTRAINT FK_COMMENTS_USERID FOREIGN KEY(user_id) REFERENCES USERS(user_id)
);

CREATE TABLE SUBSCRIBE --구독관리
(
    subscriber_id varchar2(20), --구독자 아이디
    target_userid varchar2(20), -- 구독 대상자 아이디
    CONSTRAINT PK_SUBSCRIBE PRIMARY KEY(subscriber_id, target_userid),
    CONSTRAINT FK_SUBSCRIBE_SUBSCRIBER FOREIGN KEY(subscriber_id) REFERENCES USERS(user_id),
    CONSTRAINT FK_SUBSCRIBE_TARGET FOREIGN KEY(target_userid) REFERENCES USERS(user_id)
);

CREATE TABLE VOTE -- 추천 및 비추천
(
    vote_id number(10) PRIMARY KEY, -- 시퀀스
    post_id number(10) NOT NULL, -- 추천대상 게시글
    user_id varchar2(20) NOT NULL, --추천하는 사람 ID
    y_n number(1) NOT NULL, -- 0: 추천 , 1: 비추천
    created_day date NOT NULL, -- 추천한 날짜
    CONSTRAINT FK_VOTE_POST FOREIGN KEY(post_id) REFERENCES BOARD_POST(post_id),
    CONSTRAINT FK_VOTE_USERID FOREIGN KEY(user_id) REFERENCES USERS(user_id)
);

CREATE TABLE NOTIFICATIONS -- 알림
(
    notify_id number(10) NOT NULL, --시퀀스
    user_id varchar2(20) NOT NULL, --알림받는 사람 아이디
    notify_type number(1) NOT NULL, -- 0: 구독자알림, 1: 새댓글 알림, 2: 대댓글 알림, 3:추천비추천 알림, 4: 쪽지알림
    sender_id varchar2(20) NOT NULL, --알림 보낸사람 아이디
    post_id number(10), -- 알림이 동작된 글번호(알림대상 게시글)
    comment_id number(10), -- 알림이 동작된 댓글번호(대댓글 알림대상 번호)
    CONSTRAINT FK_NOTIFICATION_POST FOREIGN KEY(post_id) REFERENCES BOARD_POST(post_id),
    CONSTRAINT FK_NOTIFICATION_COMMENT FOREIGN KEY(comment_id) REFERENCES COMMENTS(comment_id),
    CONSTRAINT FK_NOTIFICATION_USERID FOREIGN KEY(user_id) REFERENCES USERS(user_id),
    CONSTRAINT FK_NOTIFICATION_SENDER FOREIGN KEY(sender_id) REFERENCES USERS(user_id)
);

CREATE TABLE BOARD_ACCUSATION -- 신고게시글
(
    accusate_id number(10) PRIMARY KEY, --시퀀스
    user_id varchar2(20) NOT NULL, --글쓴이
    category_id number(1) NOT NULL, --카테고리번호
    target_id varchar2(20) NOT NULL, --신고 대상자 아이디
    title varchar2(20) NOT NULL, --글제목
    content varchar2(4000) NOT NULL, --글내용
    created_day date NOT NULL, --글 작성일
    post_id number(10), -- 신고 대상 글번호
    comment_id number(10), -- 신고 대상 댓글번호
    CONSTRAINT FK_ACCUSATION_POST FOREIGN KEY(post_id) REFERENCES BOARD_POST(post_id),
    CONSTRAINT FK_ACCUSATION_COMMENT FOREIGN KEY(comment_id) REFERENCES COMMENTS(comment_id),
    CONSTRAINT FK_ACCUSATION_USERID FOREIGN KEY(user_id) REFERENCES USERS(user_id),
    CONSTRAINT FK_ACCUSATION_TARGETID FOREIGN KEY(target_id) REFERENCES USERS(user_id)
);

CREATE TABLE PAYMENT --결제테이블
(
    payment_id varchar2(50) PRIMARY KEY, -- 주문번호(카카오톡 TID 결제번호)
    user_id varchar2(20) NOT NULL,       -- 유저아이디
    price number(10) NOT NULL,           -- 결제금액
    status number(1),         -- 결제상태 (0: 결제완료(취소가능), 1:결제완료(취소불가), 2: 결제취소)
    payment_date date,           -- 결제 날짜
    CONSTRAINT FK_PAY_ID FOREIGN KEY(user_id) REFERENCES USERS(user_id)
);

CREATE TABLE OTT -- OTT 목록 테이블
(
    ott_id number(10) PRIMARY KEY, -- OTT 번호(안정성을 위해 시퀀스 안쓰고 직접 타이핑)
    ott_name varchar2(30), -- OTT 이름
    month_price number(10), --월 구독료
    domain_addr varchar2(100) -- 도메인 주소
);

CREATE TABLE PARTY -- 파티테이블
(
    party_id number(10) PRIMARY KEY, -- 시퀀스
    ott_id number(10) NOT NULL, -- 파티의 OTT 종류
    leader varchar2(20) NOT NULL, --파티장 ID (FK)
    member_num number(1) NOT NULL, -- 현재 파티원 정원
    invite_code varchar2(50) NOT NULL, --파티 초대 코드(파티장만 이용가능)
    party_state number(1) NOT NULL, -- 파티상태 (0: 매칭진행중, 1: 매칭완료됨, 2: 파티해체예정, 3: 파티해체)
    share_id varchar2(50) NOT NULL, -- 공유 아이디
    share_pwd varchar2(50) NOT NULL, --공유 비밀번호
    expiration_date date NOT NULL, -- 계정만료일
    start_day date NOT NULL, --매칭 시작일(매칭이 재시작 될때마다 업데이트)
    CONSTRAINT FK_PARTY_OTT FOREIGN KEY(ott_id) REFERENCES OTT(ott_id),
    CONSTRAINT FK_PARTY_LEADER FOREIGN KEY(leader) REFERENCES USERS(user_id)
);

CREATE TABLE SETTLE -- 정산테이블
(
    settle_id number(10) PRIMARY KEY, -- 시퀀스
    party_id number(10) NOT NULL, -- 소속 파티 id
    target_id varchar2(20) NOT NULL, -- 정산해줄 파티장의 사용자ID
    price number(10) NOT NULL, -- 정산해줄 금액
    settle_state number(1) NOT NULL, -- 정산상태( 0: 정산 대기중, 1: 정산 완료)
    settle_day date NOT NULL, -- 정산해야 할 날짜
    CONSTRAINT FK_SETTLE_PARTYID FOREIGN KEY(party_id) REFERENCES PARTY(party_id),
    CONSTRAINT FK_SETTLE_TARGET FOREIGN KEY(target_id) REFERENCES USERS(user_id)
);

CREATE TABLE MATCHING -- 매칭테이블
(
    party_id number(10) PRIMARY KEY, -- 파티 ID (PK and FK)
    user_id varchar2(20) NOT NULL, -- 멤버유저 ID (FK)
    payment_id varchar2(50) NOT NULL, -- 결제번호 (FK)
    next_payment_id varchar2(50) NOT NULL, -- 다음달 결제번호 (FK)
    matching_date date NOT NULL, -- 매칭된 날짜
    CONSTRAINT FK_MATCHING_PARTYID FOREIGN KEY(party_id) REFERENCES PARTY(party_id),
    CONSTRAINT FK_MATCHING_PAYMENT FOREIGN KEY(payment_id) REFERENCES PAYMENT(payment_id),
    CONSTRAINT FK_MATCHING_NEXTPAYMENT FOREIGN KEY(next_payment_id) REFERENCES PAYMENT(payment_id)
);

CREATE TABLE WATINGROOM -- 매칭신청 대기인원 테이블
(
    wating_id number(10) PRIMARY KEY, -- 시퀀스
    user_id varchar2(20) NOT NULL, -- 유저아이디 (FK)
    ott_id number(10) NOT NULL,  -- OTT번호 (FK)
    start_day date NOT NULL, -- 매칭대기 시작일
    CONSTRAINT FK_WATINGROOM_USERID FOREIGN KEY(user_id) REFERENCES USERS(user_id),
    CONSTRAINT FK_WATINGROOM_OTTID FOREIGN KEY(ott_id) REFERENCES OTT(ott_id)
);


/*시퀀스 삭제*/
DROP SEQUENCE SEQ_ROLE;
DROP SEQUENCE SEQ_BLACKLIST;
DROP SEQUENCE SEQ_FILES;
DROP SEQUENCE SEQ_VOTE;
DROP SEQUENCE SEQ_NOTIFICATION;
DROP SEQUENCE SEQ_BOARD_CATEGORY;
DROP SEQUENCE SEQ_BOARD_POST;
DROP SEQUENCE SEQ_BOARD_ACCUSATION;
DROP SEQUENCE SEQ_SETTLE;
DROP SEQUENCE SEQ_PARTY;
DROP SEQUENCE SEQ_MATCHING;
DROP SEQUENCE SEQ_WATINGROOM;

/* 시퀀스 생성*/
CREATE SEQUENCE SEQ_ROLE; -- USER_ROLE 테이블 시퀀스
CREATE SEQUENCE SEQ_BLACKLIST; -- BLACKLIST 테이블 시퀀스
CREATE SEQUENCE SEQ_FILES; -- FILES 테이블 시퀀스
CREATE SEQUENCE SEQ_VOTE; -- VOTE 테이블 시퀀스
CREATE SEQUENCE SEQ_NOTIFICATION; -- NOTIFICATION 테이블 시퀀스
CREATE SEQUENCE SEQ_BOARD_CATEGORY; -- CATEGORY 테이블 시퀀스
CREATE SEQUENCE SEQ_BOARD_POST; -- POST 테이블 시퀀스
CREATE SEQUENCE SEQ_BOARD_ACCUSATION; -- ACCUSATION 테이블 시퀀스
CREATE SEQUENCE SEQ_SETTLE; -- SETTLE 테이블 시퀀스
CREATE SEQUENCE SEQ_PARTY; -- PARTY 테이블 시퀀스
CREATE SEQUENCE SEQ_MATCHING; -- MATCHING 테이블 시퀀스
CREATE SEQUENCE SEQ_WATINGROOM; -- WATINGROOM 테이블 시퀀스

/* 초기데이터 */

insert into ott values (0,'넷플릭스', 17000, 'https://www.netflix.com/kr/'); 
insert into ott values (1,'왓챠', 12900, 'https://watcha.com/');
insert into ott values (2,'디즈니', 9900, 'https://www.disneyplus.com/ko-kr');

commit;