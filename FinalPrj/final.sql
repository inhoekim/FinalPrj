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

DROP TABLE USERS;

/* 테이블 생성*/
CREATE TABLE USERS --유저
(
    user_id varchar2(20) PRIMARY KEY, --유저아이디
    pwd varchar2(20) NOT NULL, --유저비밀번호
    name varchar2(20) NOT NULL, --이름
    jnum varchar2(20) NOT NULL, --주민번호
    age number(5), --나이
    area varchar(20), --지역
    email varchar2(20) NOT NULL UNIQUE, --이메일
    regdate date NOT NULL, --등록일
    state number(1) DEFAULT 0 NOT NULL --유저상태(0: 정상, 1: 블랙유저, 2: 탈퇴)
);
alter table users modify(pwd varchar2(100));
도구->환경설정->환경(Environment)->UTF-8 설정

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
    visit_date varchar2(50), -- 방문시간
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

/*시퀀스 삭제*/
DROP SEQUENCE SEQ_ROLE;
DROP SEQUENCE SEQ_BLACKLIST;
DROP SEQUENCE SEQ_FILES;
DROP SEQUENCE SEQ_VOTE;
DROP SEQUENCE SEQ_NOTIFICATION;
DROP SEQUENCE SEQ_BOARD_CATEGORY;
DROP SEQUENCE SEQ_BOARD_POST;
DROP SEQUENCE SEQ_BOARD_ACCUSATION;

/* 시퀀스 생성*/
CREATE SEQUENCE SEQ_ROLE; -- USER_ROLE 테이블 시퀀스
CREATE SEQUENCE SEQ_BLACKLIST; -- BLACKLIST 테이블 시퀀스
CREATE SEQUENCE SEQ_FILES; -- FILES 테이블 시퀀스
CREATE SEQUENCE SEQ_VOTE; -- VOTE 테이블 시퀀스
CREATE SEQUENCE SEQ_NOTIFICATION; -- NOTIFICATION 테이블 시퀀스
CREATE SEQUENCE SEQ_BOARD_CATEGORY; -- CATEGORY 테이블 시퀀스
CREATE SEQUENCE SEQ_BOARD_POST; -- POST 테이블 시퀀스
CREATE SEQUENCE SEQ_BOARD_ACCUSATION; -- ACCUSATION 테이블 시퀀스