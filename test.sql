-- 산림청 등산로 데이터, ITRF2000 TM 좌표계
CREATE TABLE mountainroad (
    fid number NOT NULL PRIMARY KEY,    -- Sequence(FID)
    pmntn_sn number,                    -- 등산로 순번(PMNTN_SN)
    mntn_code varchar2(9),              -- 산코드(MNTN_CODE)
    mntn_nm varchar2(50),               -- 산 이름(MNTN_NM)
    pmntn_nm varchar2(50),              -- 등산로 이름(PMNTN_NM)
    pmntn_main varchar2(200),           -- 등산로 주요 지점 내용(PMNTN_MAIN)
    pmntn_lt number,                    -- 등산로 길이(PMNTN_LT)
    pmntn_dffl varchar2(8),             -- 등산로 난이도명(어려움/중간/쉬움)(PMNTN_DFFL)
    pmntn_uppl number,                  -- 등산로 상행 시간(PMNTN_UPPL)
    pmntn_godn number,                  -- 등산로 하행 시간(PMNTN_GODN)
    pmntn_mtrq varchar2(200),           -- 등산로 재질 내용(PMNTN_MTRQ)
    pmntn_cnrl char(1),                 -- 등산로 통제 여부(PMNTN_CNRL)
    pmntn_cls_ char(1),                 -- 등산로 폐쇄 여부(PMNTN_CLS_)
    pmntn_risk varchar2(200),           -- 등산로 위험 구간 내용(PMNTN_RISK)
    pmntn_reco char(1),                 -- 등산로 추천 여부(PMNTN_RECO)
    data_stdr_ date,                    -- 데이터 기준 일자(DATA_STDR_)
    mntn_id varchar2(10)                -- 산 ID, (구)산코드(MNTN_ID)
);

CREATE Sequence seqMountainroad START WITH 0 INCREMENT BY 1 MINVALUE 0; -- 0부터 시작해야 한다.


-- 산림청 등산로 SPOT 데이터, ITRF2000 좌표계
CREATE TABLE mountainspot (
    seq number NOT NULL PRIMARY KEY,     -- Sequence(FID)
    spot_num number NOT NULL,            -- 등산로 지점 순번(PMNTN_SPOT) 
    mt_code varchar2(9) NOT NULL,        -- 산코드(MNTN_CODE)
    spot_name varchar2(200) NOT NULL,    -- 지점 명칭(DETAIL_SPO)
    mt_name varchar2(100) NOT NULL,      -- 산 이름(MNTN_NM)
    geo_x number NOT NULL,               -- spot x좌표(geometry x)
    geo_y number NOT NULL                -- spot y좌표(geometry y)
);

CREATE Sequence seqMountainspot START WITH 0 INCREMENT BY 1 MINVALUE 0;  

INSERT INTO mountainspot (seq, spot_num, mt_code, spot_name, mt_name, geo_x, geo_y) VALUES (seqMountainspot.nextVal, 44700, '113050202', '시종점', '북한산_백운대', 194062.62640000135, 558050.8069000002);
INSERT INTO mountainspot (seq, spot_num, mt_code, spot_name, mt_name, geo_x, geo_y) VALUES (seqMountainspot.nextVal, 44701, '113050202', '시종점', '북한산_백운대', 194165.5502000032, 557192.15909999982);
INSERT INTO mountainspot (seq, spot_num, mt_code, spot_name, mt_name, geo_x, geo_y) VALUES (seqMountainspot.nextVal, 44702, '113050202', '분기점', '북한산_백운대', 194242.75, 558027.25030000135);
INSERT INTO mountainspot (seq, spot_num, mt_code, spot_name, mt_name, geo_x, geo_y) VALUES (seqMountainspot.nextVal, 44703, '113050202', '분기점', '북한산_백운대', 194262.85280000046, 557244.287200002);
INSERT INTO mountainspot (seq, spot_num, mt_code, spot_name, mt_name, geo_x, geo_y) VALUES (seqMountainspot.nextVal, 44704, '113050202', '분기점', '북한산_백운대', 194405.03100000042, 557848.54439999908);
INSERT INTO mountainspot (seq, spot_num, mt_code, spot_name, mt_name, geo_x, geo_y) VALUES (seqMountainspot.nextVal, 44705, '113050202', '분기점', '북한산_백운대', 194594.60190000199, 558046.01410000212);
INSERT INTO mountainspot (seq, spot_num, mt_code, spot_name, mt_name, geo_x, geo_y) VALUES (seqMountainspot.nextVal, 44706, '113050202', '분기점', '북한산_백운대', 194603.15309999976, 558026.85890000127);
INSERT INTO mountainspot (seq, spot_num, mt_code, spot_name, mt_name, geo_x, geo_y) VALUES (seqMountainspot.nextVal, 44707, '113050202', '시종점', '북한산_백운대', 194685.22460000031, 560545.07010000199);
INSERT INTO mountainspot (seq, spot_num, mt_code, spot_name, mt_name, geo_x, geo_y) VALUES (seqMountainspot.nextVal, 44708, '113050202', '분기점', '북한산_백운대', 194762.25430000108, 560560.70560000464);
INSERT INTO mountainspot (seq, spot_num, mt_code, spot_name, mt_name, geo_x, geo_y) VALUES (seqMountainspot.nextVal, 44709, '113050202', '분기점', '북한산_백운대', 194926.35089999903, 557658.97350000031);
INSERT INTO mountainspot (seq, spot_num, mt_code, spot_name, mt_name, geo_x, geo_y) VALUES (seqMountainspot.nextVal, 44710, '113050202', '시종점', '북한산_백운대', 194992.86799999885, 560128.4998000022);

