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
DROP TABLE PROFILEIMG;

/* 테이블 생성*/
CREATE TABLE PROFILEIMG -- 프로필이미지 테이블
(
    profile_id number(10) PRIMARY KEY, -- 시퀀스
    org_name varchar2(100), -- 원본사진이름
    src_name varchar2(100) -- 저장된 파일이름
);

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
    profile_id number(10), --프로필 사진 이미지파일 이름 (FK)
    black_enabled char(1) DEFAULT 1 NOT NULL, --블랙 상태(0:블랙유저 / 1:정상
    enabled char(1) DEFAULT 1 NOT NULL, -- 유저 상태(0:탈퇴 / 1:정상) 
    CONSTRAINT FK_USERS_PROFILE FOREIGN KEY(profile_id) REFERENCES PROFILEIMG(profile_id) 
);

CREATE TABLE BOARD_CATEGORY --게시판 카테고리
(
    category_id number(10) PRIMARY KEY, --시퀀스
    category_name varchar2(20) NOT NULL -- 카테고리 이름
);

CREATE TABLE BOARD_POST -- 게시글
(
    post_id number(10) PRIMARY KEY, --시퀀스
    user_id varchar2(20) NOT NULL, --글쓴이
    category_id number(1) NOT NULL, --카테고리번호
    subcate number(3) NOT NULL, --분류 (0:전체 / 1:공지 / 2:파티찾기 / 3:자유 / 4:신고)
    title varchar2(150) NOT NULL, --글제목
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
    parent_id varchar2(20),--답글이면 그 댓글의 부모아이디
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
    post_id number(10), -- 추천대상 게시글
    comment_id number(10),--추천대상 댓글
    user_id varchar2(20) NOT NULL, --추천하는 사람 ID
    created_day date NOT NULL, -- 추천한 날짜
    CONSTRAINT FK_VOTE_POST FOREIGN KEY(post_id) REFERENCES BOARD_POST(post_id),
    CONSTRAINT FK_VOTE_USERID FOREIGN KEY(user_id) REFERENCES USERS(user_id),
    CONSTRAINT FK_VOTE_COMMNETID FOREIGN KEY(comment_id) REFERENCES comments(comment_id)
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
    target_id varchar2(20) NOT NULL, --신고 대상자 아이디
    title varchar2(20) NOT NULL, --글제목
    content varchar2(4000) NOT NULL, --글내용
    why number(1) NOT NULL, --신고사유 (0:혐오발언, 1:음란물게시, 2:광고, 3:기타)
    created_day date NOT NULL, --글 작성일
    result number(1), -- 처리상태 (0:처리대기, 1:정지처분, 2:오신고)
    post_id number(10), -- 신고 대상 글번호
    comment_id number(10), -- 신고 대상 댓글번호
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
    invite_code varchar2(50) UNIQUE, --파티 초대 코드(파티장만 이용가능)
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
    settle_state number(1) NOT NULL, -- 정산상태( 0: 정산 대기중, 1: 정산 완료 , 2: 정산 취소)
    settle_day date NOT NULL, -- 정산해야 할 날짜
    bank_id number(3) NOT NULL, -- 은행 ID(0: KEB하나, 1: KB국민, 2: 신한, 3: NH농협, 4: 우체국, 5: IBK기업)
    bank_account varchar2(30) NOT NULL, -- 계좌번호
    CONSTRAINT FK_SETTLE_PARTYID FOREIGN KEY(party_id) REFERENCES PARTY(party_id),
    CONSTRAINT FK_SETTLE_TARGET FOREIGN KEY(target_id) REFERENCES USERS(user_id)
);

CREATE TABLE MATCHING -- 매칭테이블
(
    party_id number(10), -- 파티 ID (PK and FK)
    user_id varchar2(20), -- 멤버유저 ID (PK and FK)
    payment_id varchar2(50), -- 결제번호 (FK)
    next_payment_id varchar2(50), -- 다음달 결제번호 (FK)
    matching_date date NOT NULL, -- 매칭된 날짜
    CONSTRAINT PK_MATCHING PRIMARY KEY(party_id, user_id),
    CONSTRAINT FK_MATCHING_PARTYID FOREIGN KEY(party_id) REFERENCES PARTY(party_id)
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
DROP SEQUENCE SEQ_PROFILE;

/* 시퀀스 생성*/
CREATE SEQUENCE SEQ_ROLE; -- USER_ROLE 테이블 시퀀스
CREATE SEQUENCE SEQ_BLACKLIST; -- BLACKLIST 테이블 시퀀스
CREATE SEQUENCE SEQ_FILES; -- FILES 테이블 시퀀스
CREATE SEQUENCE SEQ_VOTE; -- VOTE 테이블 시퀀스
CREATE SEQUENCE SEQ_NOTIFICATION; -- NOTIFICATION 테이블 시퀀스
CREATE SEQUENCE SEQ_BOARD_CATEGORY START WITH 4; -- CATEGORY 테이블 시퀀스
CREATE SEQUENCE SEQ_BOARD_POST; -- POST 테이블 시퀀스
CREATE SEQUENCE SEQ_BOARD_ACCUSATION; -- ACCUSATION 테이블 시퀀스
CREATE SEQUENCE SEQ_SETTLE; -- SETTLE 테이블 시퀀스
CREATE SEQUENCE SEQ_PARTY; -- PARTY 테이블 시퀀스
CREATE SEQUENCE SEQ_MATCHING; -- MATCHING 테이블 시퀀스
CREATE SEQUENCE SEQ_WATINGROOM; -- WATINGROOM 테이블 시퀀스
CREATE SEQUENCE SEQ_PROFILE START WITH 9; -- PROFILEIMG 테이블 시퀀스

/* 초기데이터 */

insert into ott values (0,'넷플릭스', 17000, 'https://www.netflix.com/kr/'); 
insert into ott values (1,'왓챠', 12900, 'https://watcha.com/');
insert into ott values (2,'디즈니', 9900, 'https://www.disneyplus.com/ko-kr');

insert into PROFILEIMG values (1,'man1-64.png', 'man1-64.png'); 
insert into PROFILEIMG values (2,'man2-64.png', 'man2-64.png'); 
insert into PROFILEIMG values (3,'man3-64.png', 'man3-64.png'); 
insert into PROFILEIMG values (4,'man4-64.png', 'man4-64.png'); 
insert into PROFILEIMG values (5,'woman1-64.png', 'woman1-64.png'); 
insert into PROFILEIMG values (6,'woman2-64.png', 'woman2-64.png'); 
insert into PROFILEIMG values (7,'woman3-64.png', 'woman3-64.png'); 
insert into PROFILEIMG values (8,'woman4-64.png', 'woman4-64.png'); 

insert into BOARD_CATEGORY values(0,'넷플릭스');
insert into BOARD_CATEGORY values(1,'왓챠');
insert into BOARD_CATEGORY values(2,'디즈니');
insert into BOARD_CATEGORY values(3,'전체공지');

commit;


-- 채팅회원
CREATE TABLE CHAT_MEMBERS
(
	-- 아이디num 시퀀스
	user_id_num number(10) NOT NULL,
	-- 아이디
	user_id VARCHAR2(20) NOT NULL,
	-- 이름
	name VARCHAR2(20),
	-- 나이
	age number(5),
	-- 프로필 사진 이미지파일 이름 (FK)
	profile_id number(10),
	-- 유저 상태(0:탈퇴 / 1:정상)
	enabled char(1) DEFAULT 1 NOT NULL,
	PRIMARY KEY (user_id_num),
	CONSTRAINT FK_POST_USERID FOREIGN KEY(user_id) REFERENCES USERS(user_id),
	CONSTRAINT FK_USERS_PROFILE FOREIGN KEY(profile_id) REFERENCES PROFILEIMG(profile_id)
);

-- insert into chat_members values(SEQ_CHAT_MEMBERS.nextval,'test','이름',20,1,'0');


-- 채팅메세지
CREATE TABLE CHAT_MESSAGE
(
	-- 메세지아이디 시퀀스
	MSGID NUMBER(10) NOT NULL,
	-- 메세지내용
	MSGMESSAGE VARCHAR2(1000),
	-- 메세지시간
	MSGTIME DATE,
    	-- 시스템메세지
   	MSGSYSMSG VARCHAR2(1000),
	-- 아이디
	user_id VARCHAR2(100) NOT NULL,
	-- 채팅방아이디
	CRID NUMBER(4) NOT NULL,
	PRIMARY KEY (MSGID)
);


-- 채팅방
CREATE TABLE CHAT_ROOM
(
	-- 채팅방아이디 시퀀스
	CRID NUMBER(10) NOT NULL,
	PRIMARY KEY (CRID)
);


-- 채팅방연결
CREATE TABLE CHAT_ROOMJOIN
(
	-- 연결아이디 시퀀스
	JOINID NUMBER(10) NOT NULL,
	-- 마지막접속시간
	JOINCONTIME DATE,
	-- 아이디
	user_id VARCHAR2(100) NOT NULL,
	-- 채팅방아이디
	CRID NUMBER(4) NOT NULL,
	PRIMARY KEY (JOINID)
);

CREATE SEQUENCE SEQ_CHAT_MEMBERS ;
CREATE SEQUENCE SEQ_CHAT_MESSAGE ;
CREATE SEQUENCE SEQ_CHAT_ROOMJOIN ;
CREATE SEQUENCE SEQ_CHAT_ROOM ;

-- 채팅초기데이터
insert into profileimg values(9,'9','9');
insert into profileimg values(10,'10','10');
insert into profileimg values(11,'11','11');
insert into profileimg values(12,'12','12');

insert into chat_members values(1, 'test1', 'name1', 1, 9, '1');
insert into chat_members values(2, 'test2', 'name2', 2, 10, '1');
insert into chat_members values(3, 'test3', 'name3', 3, 11, '1');
insert into chat_members values(4, 'admin', 'admin', 29, 12, '1');
insert into chat_members values(5, 'test', '장민수', 29, 4, '1');

commit;