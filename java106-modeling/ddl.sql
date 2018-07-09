-- 수강신청
DROP TABLE IF EXISTS APPL RESTRICT;

-- 강사
DROP TABLE IF EXISTS TCHR RESTRICT;

-- 담당자
DROP TABLE IF EXISTS MGR RESTRICT;

-- 교실
DROP TABLE IF EXISTS CLSRM RESTRICT;

-- 게시판
DROP TABLE IF EXISTS BOARD RESTRICT;

-- 강좌
DROP TABLE IF EXISTS LECT RESTRICT;

-- 강사사진
DROP TABLE IF EXISTS TCHR_PHOT RESTRICT;

-- 교실사진
DROP TABLE IF EXISTS CLS_PHOT RESTRICT;

-- 학생
DROP TABLE IF EXISTS STUD RESTRICT;

-- 주소
DROP TABLE IF EXISTS ADDR RESTRICT;

-- 강사배정
DROP TABLE IF EXISTS LECT_TCHR RESTRICT;

-- 사용자
DROP TABLE IF EXISTS USER RESTRICT;

-- 수강신청
CREATE TABLE APPL (
    ANO      INTEGER      NOT NULL COMMENT '수강신청번호', -- 수강신청번호
    LNO      INTEGER      NOT NULL COMMENT '강좌번호', -- 강좌번호
    RDT      DATE         NOT NULL COMMENT '수강신청일', -- 수강신청일
    RSLT     VARCHAR(10)  NULL     COMMENT '신청결과', -- 신청결과
    RSLT_MSG VARCHAR(255) NULL     COMMENT '신청결과이유', -- 신청결과이유
    SNO      INTEGER      NOT NULL COMMENT '수강신청자번호' -- 수강신청자번호
)
COMMENT '수강신청';

-- 수강신청
ALTER TABLE APPL
    ADD CONSTRAINT PK_APPL -- 수강신청 기본키
        PRIMARY KEY (
            ANO -- 수강신청번호
        );

ALTER TABLE APPL
    MODIFY COLUMN ANO INTEGER NOT NULL AUTO_INCREMENT COMMENT '수강신청번호';

-- 강사
CREATE TABLE TCHR (
    TNO    INTEGER NOT NULL COMMENT '강사번호', -- 강사번호
    HR_PAY INTEGER NULL     COMMENT '시강료' -- 시강료
)
COMMENT '강사';

-- 강사
ALTER TABLE TCHR
    ADD CONSTRAINT PK_TCHR -- 강사 기본키
        PRIMARY KEY (
            TNO -- 강사번호
        );

-- 담당자
CREATE TABLE MGR (
    MNO  INTEGER      NOT NULL COMMENT '담당자번호', -- 담당자번호
    PATH VARCHAR(255) NULL     COMMENT '사진' -- 사진
)
COMMENT '담당자';

-- 담당자
ALTER TABLE MGR
    ADD CONSTRAINT PK_MGR -- 담당자 기본키
        PRIMARY KEY (
            MNO -- 담당자번호
        );

-- 교실
CREATE TABLE CLSRM (
    CRNO INTEGER     NOT NULL COMMENT '교실번호', -- 교실번호
    LOC  VARCHAR(50) NOT NULL COMMENT '센터', -- 센터
    TITL VARCHAR(50) NOT NULL COMMENT '교실명', -- 교실명
    CAPA INTEGER     NOT NULL COMMENT '최대수용인원' -- 최대수용인원
)
COMMENT '교실';

-- 교실
ALTER TABLE CLSRM
    ADD CONSTRAINT PK_CLSRM -- 교실 기본키
        PRIMARY KEY (
            CRNO -- 교실번호
        );

ALTER TABLE CLSRM
    MODIFY COLUMN CRNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '교실번호';

-- 게시판
CREATE TABLE BOARD (
    BNO   INTEGER      NOT NULL COMMENT '게시물번호', -- 게시물번호
    TITL  VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
    CONTS TEXT         NOT NULL COMMENT '내용', -- 내용
    CDT   DATETIME     NOT NULL COMMENT '등록일', -- 등록일
    VWCNT INTEGER      NULL     COMMENT '조회수', -- 조회수
    PWD   VARCHAR(150) NULL     COMMENT '암호' -- 암호
)
COMMENT '게시판';

-- 게시판
ALTER TABLE BOARD
    ADD CONSTRAINT PK_BOARD -- 게시판 기본키
        PRIMARY KEY (
            BNO -- 게시물번호
        );

ALTER TABLE BOARD
    MODIFY COLUMN BNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '게시물번호';

-- 강좌
CREATE TABLE LECT (
    LNO   INTEGER      NOT NULL COMMENT '강좌번호', -- 강좌번호
    TITL  VARCHAR(255) NOT NULL COMMENT '강의명', -- 강의명
    CONTS TEXT         NOT NULL COMMENT '내용', -- 내용
    SDT   DATE         NOT NULL COMMENT '시작일', -- 시작일
    EDT   DATE         NOT NULL COMMENT '종료일', -- 종료일
    CAPA  INTEGER      NOT NULL COMMENT '정원', -- 정원
    CRNO  INTEGER      NULL     COMMENT '교실번호', -- 교실번호
    MNO   INTEGER      NULL     COMMENT '담당자번호' -- 담당자번호
)
COMMENT '강좌';

-- 강좌
ALTER TABLE LECT
    ADD CONSTRAINT PK_LECT -- 강좌 기본키
        PRIMARY KEY (
            LNO -- 강좌번호
        );

-- 강좌 인덱스
CREATE INDEX IX_LECT
    ON LECT( -- 강좌
        TITL ASC -- 강의명
    );

ALTER TABLE LECT
    MODIFY COLUMN LNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '강좌번호';

-- 강사사진
CREATE TABLE TCHR_PHOT (
    TPNO INTEGER      NOT NULL COMMENT '강사사진번호', -- 강사사진번호
    PATH VARCHAR(255) NOT NULL COMMENT '사진', -- 사진
    TNO  INTEGER      NOT NULL COMMENT '강사번호' -- 강사번호
)
COMMENT '강사사진';

-- 강사사진
ALTER TABLE TCHR_PHOT
    ADD CONSTRAINT PK_TCHR_PHOT -- 강사사진 기본키
        PRIMARY KEY (
            TPNO -- 강사사진번호
        );

ALTER TABLE TCHR_PHOT
    MODIFY COLUMN TPNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '강사사진번호';

-- 교실사진
CREATE TABLE CLS_PHOT (
    CPNO INTEGER      NOT NULL COMMENT '교실사진번호', -- 교실사진번호
    PATH VARCHAR(255) NOT NULL COMMENT '사진', -- 사진
    CRNO INTEGER      NOT NULL COMMENT '교실번호' -- 교실번호
)
COMMENT '교실사진';

-- 교실사진
ALTER TABLE CLS_PHOT
    ADD CONSTRAINT PK_CLS_PHOT -- 교실사진 기본키
        PRIMARY KEY (
            CPNO -- 교실사진번호
        );

ALTER TABLE CLS_PHOT
    MODIFY COLUMN CPNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '교실사진번호';

-- 학생
CREATE TABLE STUD (
    SNO     INTEGER     NOT NULL COMMENT '수강신청자번호', -- 수강신청자번호
    SCH_LVL VARCHAR(50) NOT NULL COMMENT '신청자학력', -- 신청자학력
    WORK    CHAR(1)     NOT NULL COMMENT '신청자재직유무', -- 신청자재직유무
    BANK    VARCHAR(50) NULL     COMMENT '은행명', -- 은행명
    ACCT    VARCHAR(20) NULL     COMMENT '통장번호', -- 통장번호
    MAJ     VARCHAR(50) NOT NULL COMMENT '전공' -- 전공
)
COMMENT '학생';

-- 학생
ALTER TABLE STUD
    ADD CONSTRAINT PK_STUD -- 학생 기본키
        PRIMARY KEY (
            SNO -- 수강신청자번호
        );

-- 학생 유니크 인덱스
CREATE UNIQUE INDEX UIX_STUD
    ON STUD ( -- 학생
        BANK ASC, -- 은행명
        ACCT ASC  -- 통장번호
    );

-- 주소
CREATE TABLE ADDR (
    ADNO     INTEGER      NOT NULL COMMENT '주소번호', -- 주소번호
    PSTNO    CHAR(5)      NOT NULL COMMENT '우편번호', -- 우편번호
    BAS_ADDR VARCHAR(100) NOT NULL COMMENT '기본주소' -- 기본주소
)
COMMENT '주소';

-- 주소
ALTER TABLE ADDR
    ADD CONSTRAINT PK_ADDR -- 주소 기본키
        PRIMARY KEY (
            ADNO -- 주소번호
        );

-- 주소 인덱스
CREATE INDEX IX_ADDR
    ON ADDR( -- 주소
        PSTNO ASC -- 우편번호
    );

ALTER TABLE ADDR
    MODIFY COLUMN ADNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '주소번호';

-- 강사배정
CREATE TABLE LECT_TCHR (
    LNO INTEGER NOT NULL COMMENT '강좌번호', -- 강좌번호
    TNO INTEGER NOT NULL COMMENT '강사번호' -- 강사번호
)
COMMENT '강사배정';

-- 강사배정
ALTER TABLE LECT_TCHR
    ADD CONSTRAINT PK_LECT_TCHR -- 강사배정 기본키
        PRIMARY KEY (
            LNO, -- 강좌번호
            TNO  -- 강사번호
        );

-- 사용자
CREATE TABLE USER (
    UNO      INTEGER      NOT NULL COMMENT '사용자번호', -- 사용자번호
    NAME     VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
    EMAIL    VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
    PWD      VARCHAR(150) NOT NULL COMMENT '암호', -- 암호
    TEL      VARCHAR(30)  NOT NULL COMMENT '전화', -- 전화
    ADNO     INTEGER      NULL     COMMENT '주소번호', -- 주소번호
    DET_ADDR VARCHAR(100) NULL     COMMENT '상세주소' -- 상세주소
)
COMMENT '사용자';

-- 사용자
ALTER TABLE USER
    ADD CONSTRAINT PK_USER -- 사용자 기본키
        PRIMARY KEY (
            UNO -- 사용자번호
        );

-- 사용자 유니크 인덱스
CREATE UNIQUE INDEX UIX_USER
    ON USER ( -- 사용자
        EMAIL ASC -- 이메일
    );

ALTER TABLE USER
    MODIFY COLUMN UNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '사용자번호';

-- 수강신청
ALTER TABLE APPL
    ADD CONSTRAINT FK_STUD_TO_APPL -- 학생 -> 수강신청
        FOREIGN KEY (
            SNO -- 수강신청자번호
        )
        REFERENCES STUD ( -- 학생
            SNO -- 수강신청자번호
        );

-- 수강신청
ALTER TABLE APPL
    ADD CONSTRAINT FK_LECT_TO_APPL -- 강좌 -> 수강신청
        FOREIGN KEY (
            LNO -- 강좌번호
        )
        REFERENCES LECT ( -- 강좌
            LNO -- 강좌번호
        );

-- 강사
ALTER TABLE TCHR
    ADD CONSTRAINT FK_USER_TO_TCHR -- 사용자 -> 강사
        FOREIGN KEY (
            TNO -- 강사번호
        )
        REFERENCES USER ( -- 사용자
            UNO -- 사용자번호
        );

-- 담당자
ALTER TABLE MGR
    ADD CONSTRAINT FK_USER_TO_MGR -- 사용자 -> 담당자
        FOREIGN KEY (
            MNO -- 담당자번호
        )
        REFERENCES USER ( -- 사용자
            UNO -- 사용자번호
        );

-- 강좌
ALTER TABLE LECT
    ADD CONSTRAINT FK_MGR_TO_LECT -- 담당자 -> 강좌
        FOREIGN KEY (
            MNO -- 담당자번호
        )
        REFERENCES MGR ( -- 담당자
            MNO -- 담당자번호
        );

-- 강좌
ALTER TABLE LECT
    ADD CONSTRAINT FK_CLSRM_TO_LECT -- 교실 -> 강좌
        FOREIGN KEY (
            CRNO -- 교실번호
        )
        REFERENCES CLSRM ( -- 교실
            CRNO -- 교실번호
        );

-- 강사사진
ALTER TABLE TCHR_PHOT
    ADD CONSTRAINT FK_TCHR_TO_TCHR_PHOT -- 강사 -> 강사사진
        FOREIGN KEY (
            TNO -- 강사번호
        )
        REFERENCES TCHR ( -- 강사
            TNO -- 강사번호
        );

-- 교실사진
ALTER TABLE CLS_PHOT
    ADD CONSTRAINT FK_CLSRM_TO_CLS_PHOT -- 교실 -> 교실사진
        FOREIGN KEY (
            CRNO -- 교실번호
        )
        REFERENCES CLSRM ( -- 교실
            CRNO -- 교실번호
        );

-- 학생
ALTER TABLE STUD
    ADD CONSTRAINT FK_USER_TO_STUD -- 사용자 -> 학생
        FOREIGN KEY (
            SNO -- 수강신청자번호
        )
        REFERENCES USER ( -- 사용자
            UNO -- 사용자번호
        );

-- 강사배정
ALTER TABLE LECT_TCHR
    ADD CONSTRAINT FK_TCHR_TO_LECT_TCHR -- 강사 -> 강사배정
        FOREIGN KEY (
            TNO -- 강사번호
        )
        REFERENCES TCHR ( -- 강사
            TNO -- 강사번호
        );

-- 강사배정
ALTER TABLE LECT_TCHR
    ADD CONSTRAINT FK_LECT_TO_LECT_TCHR -- 강좌 -> 강사배정
        FOREIGN KEY (
            LNO -- 강좌번호
        )
        REFERENCES LECT ( -- 강좌
            LNO -- 강좌번호
        );

-- 사용자
ALTER TABLE USER
    ADD CONSTRAINT FK_ADDR_TO_USER -- 주소 -> 사용자
        FOREIGN KEY (
            ADNO -- 주소번호
        )
        REFERENCES ADDR ( -- 주소
            ADNO -- 주소번호
        );