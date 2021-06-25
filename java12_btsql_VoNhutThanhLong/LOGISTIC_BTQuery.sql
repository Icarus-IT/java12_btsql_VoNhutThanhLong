##	1.	Viết câu truy vấn trả về Tên nước, tên cảng, mã cảng 
		SELECT c.NAME COUNTRY_NAME,
			p.NAME PORT_NAME,
            p.PORT_ID PORT_ID
        FROM COUNTRY c LEFT JOIN PORT p ON c.ID = p.COUNTRY
        ORDER BY c.NAME, p.NAME;
        
##	2.	Viết câu truy vấn trả về thông tin người dùng gồm first name, last name, email, phone, tên nước
		SELECT u.FIRST_NAME,
			u.LAST_NAME,
            u.EMAIl,
            u.PHONE,
            c.NAME AS `COUNTRY`
        FROM USER u LEFT JOIN COUNTRY c ON u.COUNTRY = c.ID
        ORDER BY c.NAME, u.FIRST_NAME;
##	3.	Viết câu truy vấn trả về thông tin của hành trình (voyage) gồm ID hành trình, tên tuyến (route), 
##		tên tàu, ngày bắt đầu, ngày kết thúc
		SELECT v.VOYAGE_ID,
			r.NAME ROUTE_NAME,
            s.NAME SHIP_NAME,
            v.START_DATE,
            v.END_DATE
        FROM VOYAGE v LEFT JOIN ROUTE r ON v.ROUTE_ID = r.ROUTE_ID
					  LEFT JOIN SHIP s ON v.SHIP_ID = s.SHIP_ID
		ORDER BY r.NAME, s.NAME;

##	4.	Viết câu truy vấn trả về thông tin tất cả shipment của tuyến có tên là 'Prado'
-- old syntax

-- join

-- sub-query
SELECT sh.SHIPMENT_ID,
	sh.CARGO_CONTENT,
    sh.TEQ_QUANTITY,
    sh.TOTAL_COST,
    sh.STATUS,
    vr.ROUTE_NAME
FROM SHIPMENT sh
		LEFT JOIN (SELECT v.VOYAGE_ID, r.NAME ROUTE_NAME, vs.SHIPMENT_ID FROM VOYAGE v, ROUTE r, VOYAGE_SHIPMENT vs
				    WHERE v.ROUTE_ID = r.ROUTE_ID
						AND v.VOYAGE_ID = vs.VOYAGE_ID
						AND r.NAME = 'Prado' ) vr
			ON sh.SHIPMENT_ID = vr.SHIPMENT_ID;
##	5.	Viết câu truy vấn để lấy thông tin của tất cả khách hàng đã có ít nhất 1 đơn hàng

SELECT distinct(u.USER_ID) 'USER_ID', u.LOGIN_NAME, u.FIRST_NAME, u.LAST_NAME, u.PHONE, u.EMAIL, u.ADDRESS, u.CITY, u.STATE, u.POSTAL_CODE, u.COUNTRY, u.ROLE, u.PASSWORD, u.IS_DELETED
FROM USER u, USER_SHIPMENT us
WHERE u.USER_ID = us.USER_ID  AND u.USER_ID IN (select distinct(USER_ID) 
												from USER_SHIPMENT) ;       
##	5.1	Viết câu truy vấn để lấy thông tin của tất cả khách hàng đã có ít nhất 2 đơn hàng
SELECT u.USER_ID 'USER_ID', u.LOGIN_NAME, u.FIRST_NAME, u.LAST_NAME, u.PHONE, u.EMAIL, u.ADDRESS, u.CITY, u.STATE, u.POSTAL_CODE, u.COUNTRY, u.ROLE, u.PASSWORD, u.IS_DELETED
FROM USER u
WHERE (SELECT COUNT(US.USER_ID)
                         FROM USER_SHIPMENT US
                        WHERE US.USER_ID = u.USER_ID)>1;


##	6.	Viết câu truy vấn trả về thông tin của hành trình gồm ID, ngày bắt đầu, ngày kết thúc, tên tuyến, tên tàu,
##		thông tin các shipment của hành trình gồm ID, cargo content, số lượng teq, tổng giá trị, tình trạng
SELECT distinct(v.VOYAGE_ID), v.START_DATE, v.END_DATE, r.NAME as 'ROUTE NAME', s.NAME as 'SHIP NAME', sh.CARGO_CONTENT, sh.TEQ_QUANTITY,sh.TOTAL_COST, sh.STATUS
FROM VOYAGE v, ROUTE r, SHIP s, VOYAGE_SHIPMENT vs, SHIPMENT sh
WHERE v.ROUTE_ID = r.ROUTE_ID AND v.SHIP_ID = s.SHIP_ID AND v.VOYAGE_ID=vs.VOYAGE_ID AND vs.SHIPMENT_ID = sh.SHIPMENT_ID ;

##		nâng cao: lấy thêm thông tin: cảng khởi hàng và cảng đến

SELECT distinct(v.VOYAGE_ID), v.START_DATE, v.END_DATE, r.NAME as 'ROUTE NAME', s.NAME as 'SHIP NAME', sh.CARGO_CONTENT, sh.TEQ_QUANTITY,sh.TOTAL_COST, sh.STATUS,p.NAME as 'SOURCE PORT',pd.NAME as 'DEST PORT'
FROM VOYAGE v, ROUTE r, SHIP s, VOYAGE_SHIPMENT vs, SHIPMENT sh, PORT p, PORT pd
WHERE v.ROUTE_ID = r.ROUTE_ID AND v.SHIP_ID = s.SHIP_ID AND v.VOYAGE_ID=vs.VOYAGE_ID AND vs.SHIPMENT_ID = sh.SHIPMENT_ID AND r.SOURCE_PORT_ID = p.PORT_ID AND r.DEST_PORT_ID = pd.PORT_ID ;


##	Viết câu truy vấn trả về thông tin khách hàng gồm: Full name, 
##	địa chỉ (gồm tên đường, thành phố, bang), phone, email,  tên quốc gia
SELECT concat(u.FIRST_NAME,' ',u.LAST_NAME ) as 'FULL NAME', concat(u.ADDRESS,' ',u.CITY,' ',u.STATE) as 'ADDRESS', PHONE, EMAIL, c.NAME as 'COUNTRY'
FROM USER u, COUNTRY c
WHERE u.COUNTRY = c.ID;

